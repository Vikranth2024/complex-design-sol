
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100)
);


CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    supplier_id INT,
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE SET NULL
);


CREATE TABLE product_categories (
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (product_id, category_id),
    CONSTRAINT fk_pc_product FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
    CONSTRAINT fk_pc_category FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);


CREATE TABLE product_tags (
    product_id INT NOT NULL,
    tag_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (product_id, tag_name),
    CONSTRAINT fk_tags_product FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);


CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL UNIQUE,
    warehouse_location VARCHAR(100),
    stock_quantity INT DEFAULT 0,
    CONSTRAINT fk_inventory_product FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

INSERT INTO suppliers (name, phone, email) VALUES 
('Global TechCorp', '555-0101', 'contact@techcorp.com'),
('Eco-Solutions', '555-0202', 'sales@ecosolutions.org');

INSERT INTO categories (category_name) VALUES 
('Electronics'), 
('Home Office'), 
('Sustainability');

INSERT INTO products (product_name, price, supplier_id) VALUES 
('Wireless Mouse', 25.99, 1),
('Ergonomic Chair', 199.50, 2),
('USB-C Hub', 45.00, 1);

INSERT INTO product_categories (product_id, category_id) VALUES 
(1, 1), 
(2, 2), 
(2, 3), 
(3, 1); 

INSERT INTO inventory (product_id, warehouse_location, stock_quantity) VALUES 
(1, 'Warehouse A', 150),
(2, 'Warehouse B', 8),
(3, 'Warehouse A', 45);

