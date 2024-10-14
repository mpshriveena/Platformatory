# Run
sudo pg_ctlcluster 12 main start
# Login
sudo -u postgres psql
# Create Database
CREATE DATABASE inventory;
# Move inside it
\c inventory
# Create table
CREATE TABLE purchases (
    id SERIAL PRIMARY KEY,
    item_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2),
    update_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
# Insert Data
INSERT INTO purchases (item_name, quantity, price) VALUES ('Laptop', 3, 1200.00);
INSERT INTO purchases (item_name, quantity, price) VALUES ('Mouse', 10, 25.50);
INSERT INTO purchases (item_name, quantity, price) VALUES ('Keyboard', 5, 45.00);
# Verify inserted data
SELECT * FROM purchases;
# Exit
\q
