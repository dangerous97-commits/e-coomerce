
-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50),
    created_date DATE
);

-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Customers
INSERT INTO Customers VALUES
(1, 'Amit Sharma', 'amit@example.com', 'India', '2023-01-10'),
(2, 'Priya Verma', 'priya@example.com', 'India', '2023-02-15'),
(3, 'John Smith', 'john@example.com', 'USA', '2023-03-12'),
(4, 'Maria Garcia', 'maria@example.com', 'Spain', '2023-04-20');

-- Insert Products
INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 50000, 20),
(2, 'Mobile Phone', 'Electronics', 20000, 50),
(3, 'Headphones', 'Accessories', 1500, 100),
(4, 'Office Chair', 'Furniture', 7000, 10);

-- Insert Orders
INSERT INTO Orders VALUES
(101, 1, '2023-05-01', 52000),
(102, 2, '2023-05-03', 20000),
(103, 1, '2023-05-10', 1500),
(104, 3, '2023-05-15', 7700);

-- Insert OrderDetails
INSERT INTO OrderDetails VALUES
(1, 101, 1, 1, 50000),
(2, 101, 3, 1, 1500),
(3, 102, 2, 1, 20000),
(4, 103, 3, 1, 1500),
(5, 104, 4, 1, 7000),
(6, 104, 3, 1, 1500);
