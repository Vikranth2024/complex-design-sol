
SELECT * FROM products;


SELECT p.product_name, c.category_name
FROM products p
JOIN product_categories pc ON p.product_id = pc.product_id
JOIN categories c ON pc.category_id = c.category_id
WHERE c.category_name = 'Electronics';


SELECT p.product_name, s.name AS supplier_name, s.phone AS supplier_phone
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id;


SELECT p.product_name, i.stock_quantity
FROM products p
JOIN inventory i ON p.product_id = i.product_id
WHERE i.stock_quantity < 10;