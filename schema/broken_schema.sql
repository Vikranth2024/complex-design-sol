

CREATE TABLE products (

    product_id INT PRIMARY KEY,

    product_name VARCHAR(100),

 
    categories VARCHAR(255),

   
    supplier_name VARCHAR(100),
    supplier_phone VARCHAR(20),
    supplier_email VARCHAR(100),

    
    product_tags VARCHAR(255),

    price DECIMAL(10,2),

    
    warehouse_location VARCHAR(100),
    stock_quantity INT

);

