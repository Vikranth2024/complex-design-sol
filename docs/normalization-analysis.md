# 📊 Database Normalization Analysis & Trade-offs

## 1. Identified Issues (Pre-Normalization)
The original `products` table was in an unnormalized state (0NF), leading to several operational risks:
*   **Multi-valued Attributes (1NF Violation):** The `categories` and `tags` columns stored multiple values as strings. This made it impossible to index specific categories or perform clean lookups without expensive `LIKE` queries.
*   **Transitive Dependencies (3NF Violation):** Supplier details were stored in the product table. If one supplier provided 100 products, their phone number was repeated 100 times. Updating a phone number would require updating 100 rows, risking "Update Anomalies."
*   **Mixed Entities:** Inventory data (warehouse location) was mixed with product definitions.

## 2. Redesign Strategy (3NF)
I applied the following transformations:
1.  **Atomicity (1NF):** Created `categories` and `product_categories` tables. Category lookups are now handled via an optimized join table.
2.  **Partial Dependency Removal (2NF):** Ensured all non-key attributes depend entirely on the Primary Key.
3.  **Transitive Dependency Removal (3NF):** Extracted `suppliers` into its own table. Each product now simply holds a `supplier_id`.
4.  **Logistical Separation:** Created an `inventory` table to handle warehouse-specific data, allowing the core `products` table to stay lightweight.

## 3. Engineering Trade-offs
While 3NF improves data integrity, it introduces trade-offs:
*   **Query Complexity:** We now require `JOIN` operations to get a full product snapshot. For very high-traffic read-heavy environments, some "controlled denormalization" might be used, but for TaskSphere's current needs, 3NF is the superior choice for consistency.
*   **Storage Efficiency:** We've eliminated redundant strings (supplier names/phones), significantly reducing the storage footprint as the catalog grows.
*   **Scalability:** We can now add a new category or supplier once and link it to infinite products without duplicating data.
