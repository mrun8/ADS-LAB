CREATE DATABASE mrunali2;
USE mrunali2;

CREATE TABLE test_table (
  RecordNumber INT(3),
  CurrentDate DATE
);

DELIMITER //

CREATE PROCEDURE InsertRecords()
BEGIN
  DECLARE i INT DEFAULT 1;

  WHILE i <= 50 DO
    INSERT INTO test_table (RecordNumber, CurrentDate)
    VALUES (i, CURDATE());

    SET i = i + 1;
  END WHILE;
END //

DELIMITER ;

CALL InsertRecords();

select * from test_table;


CREATE TABLE Productss(id INT,catagory VARCHAR(255),price INT(20),stocks INT(10));

INSERT INTO Productss(id,catagory ,price ,stocks )
VALUES (1,'cat1', 100,120),
(2,'cat1',122,12),
(3,'cat2',150,110),
(2,'cat2',120,12);

DELIMITER //
CREATE PROCEDURE updatePrices(IN X DECIMAL(5,3),IN Y VARCHAR(10))
BEGIN
  UPDATE Productss
  SET price=price(1+X/100)
  where catagory=Y;
END //

DELIMITER ;
 CALL updatePrices(10.0,'cat1');
 
 select * from Productss;
  Create the products table
use Assignments;

CREATE TABLE products (
    ProductID INT(4),
    Category CHAR(3),
    Detail VARCHAR(30),
    Price DECIMAL(10, 2),
    Stock INT(5)
);
-- Modify the products table to use VARCHAR for the 'Category' column
ALTER TABLE products MODIFY COLUMN Category VARCHAR(30);


-- Now, you can insert the data again
INSERT INTO products VALUES
(1, 'Electronics', 'Smartphones', 50.00, 20),
(2, 'Electronics', 'Laptop', 75.50, 15),
(3, 'SkinCare', 'Lipbalm', 30.00, 30),
(4, 'SkinCare', 'Moisture', 99.99, 25),
(5, 'Toys', 'ToyCart', 20.56, 10),
(6, 'Toys', 'Lego', 94.23, 5);

select * from products;

-- Insert sample data
INSERT INTO products VALUES
(1, 'Electronics', 'Smartphones', 50.00, 20),
(2, 'Electronics', 'Laptop', 75.50, 15),
(3, 'SkinCare', 'Lipbalm', 30.00, 30),
(4, 'SkinCare', 'Moisture', 99.99, 25),
(5, 'Toys', 'ToyCart', 20.56, 10),
(6, 'Toys', 'Lego', 94.23, 5);

-- Delimiter is used to change the statement terminator temporarily


DELIMITER //


CREATE PROCEDURE update_prices(IN X DECIMAL(5,2), IN Y CHAR(10))
BEGIN
    UPDATE products
    SET Price = Price * (1 + X / 100)
    WHERE Category = Y AND ProductID IS NOT NULL; 
    COMMIT;
END;


-- Reset the delimiter to semicolon
DELIMITER ;



SET SQL_SAFE_UPDATES = 0;


CALL update_prices(10, 'Toys');


CREATE TABLE person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);



DROP FUNCTION IF EXISTS countNoOfWords;




DELIMITER //
CREATE FUNCTION countNoOfWords(nameValue VARCHAR(50)) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE wordCount INT;
    SET wordCount = LENGTH(nameValue) - LENGTH(REPLACE(nameValue, ' ', '')) + 1;
    RETURN wordCount;
END //
DELIMITER ;


-- Insert data into the person table
INSERT INTO person (name) VALUES ('John Doe');
INSERT INTO person (name) VALUES ('Alice Bob Charlie');
INSERT INTO person (name) VALUES ('Tom');
INSERT INTO person (name) VALUES ('');


-- function call
SELECT name, countNoOfWords(name) AS wordCount FROM person;




 
 
 