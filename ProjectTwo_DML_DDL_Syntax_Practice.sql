DROP SCHEMA IF EXISTS `noelleaxalan_dmlsyntaxpractice` CASCADE;
CREATE SCHEMA `noelleaxalan_dmlsyntaxpractice`;

--
-- Table structure for table `noelleaxalan_dmlsyntaxpractice.users`
-- 

CREATE TABLE IF NOT EXISTS `noelleaxalan_dmlsyntaxpractice.users`
(
    `user_id` INT64 NOT NULL,
    `first_name` STRING,
    `last_name` STRING,
    `email` STRING,
    `phone` STRING,
    `city` STRING,
    `state` STRING,
    `country` STRING,
    `zip_code` STRING,
    `signup_date` DATE,
    `status` STRING, 
    `preferred_contact` STRING,
    PRIMARY KEY (`user_id`) NOT ENFORCED
);

--
-- Table structure for table `noelleaxalan_dmlsyntaxpractice.categories`
-- 

CREATE TABLE `noelleaxalan_dmlsyntaxpractice.categories`
(
    `category_id` INT64,
    `category_name` STRING,
    `description` STRING,
    PRIMARY KEY (`category_id`) NOT ENFORCED
);

--
-- Table structure for table `noelleaxalan_dmlsyntaxpractice.products`
-- 

CREATE TABLE `noelleaxalan_dmlsyntaxpractice.products`
( 
    `product_id` INT64,
    `product_name` STRING,
    `category_id` INT64,
    `brand` STRING,
    `retail_price` NUMERIC,
    `cost_price` NUMERIC,
    `stock_quantity` INT64,
    PRIMARY KEY (`product_id`) NOT ENFORCED,
    FOREIGN KEY (`category_id`) REFERENCES `noelleaxalan_dmlsyntaxpractice.categories`(`category_id`) NOT ENFORCED
);

--
-- Table structure for table `noelleaxalan_dmlsyntaxpractice.orders`
-- 

CREATE TABLE `noelleaxalan_dmlsyntaxpractice.orders`
(
    `order_id` INT64,
    `user_id` INT64,
    `order_date` DATE,
    `order_status` STRING,
    `total_amount` NUMERIC,
    PRIMARY KEY (`order_id`) NOT ENFORCED,
    FOREIGN KEY (`user_id`) REFERENCES `noelleaxalan_dmlsyntaxpractice.users`(`user_id`) NOT ENFORCED
);

--
-- Table structure for table `noelleaxalan_dmlsyntaxpractice.order.items`
-- 

CREATE TABLE `noelleaxalan_dmlsyntaxpractice.orderitems`
(
    `order_item_id` INT64,
    `order_id` INT64,
    `product_id` INT64,
    `unit_price` NUMERIC,
    PRIMARY KEY (`order_item_id`) NOT ENFORCED,
    FOREIGN KEY (`order_id`) REFERENCES `noelleaxalan_dmlsyntaxpractice.orders`(`order_id`) NOT ENFORCED,
    FOREIGN KEY (`product_id`) REFERENCES `noelleaxalan_dmlsyntaxpractice.products`(`product_id`) NOT ENFORCED
);

--
-- Insert data for table `noelleaxalan_dmlsyntaxpractice.users`
-- 

INSERT INTO `noelleaxalan_dmlsyntaxpractice.users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `city`, `state`, `country`, `zip_code`, `signup_date`, `status`, `preferred_contact`)
VALUES (1, 'Alice', 'Nguyen', 'alice.nguyen@gmail.com', '3035551122', 'Denver', 'CO', 'USA', '80206', '2024-01-15', 'active', 'email'), (2, 'Marcus', 'Lee', 'marcus.lee@gmail.com', '2065558899', 'Seattle', 'WA', 'USA', '73301', '2024-02-20', 'active', 'sms'), (3, 'Priya', 'Patel', 'priya.patel@gmail.com', '5125556677', 'Austin', 'TX', 'USA', '73301', '2024-03-05', 'active', 'push'), (4, 'Jordan', 'Smith', 'jordan.smith@gmail.com', '3125556677', 'Chicago', 'IL', 'USA', '60601', '2024-03-18', 'inactive', 'email');

--
-- Alter table `noelleaxalan_dmlsyntaxpractice.orderitems` to add `quantity` column
-- 

ALTER TABLE `noelleaxalan_dmlsyntaxpractice.orderitems`
ADD COLUMN `quantity` INT64;

--
-- Insert data for table `noelleaxalan_dmlsyntaxpractice.categories`
-- 

INSERT INTO `noelleaxalan_dmlsyntaxpractice.categories` (`category_id`, `category_name`, `description`)
VALUES (1, 'Electronics', 'Devices and tech products'), (2, 'Furniture', 'Home and office furniture'), (3, 'Stationary', 'Office Supplies'), (4, 'Clothing', 'Apparel and fashion'), (5, 'Books', 'Printed and digital books');

--
-- Update Priya's email in table `noelleaxalan_dmlsyntaxpractice.users`
-- 

UPDATE `noelleaxalan_dmlsyntaxpractice.users`
SET `email` = 'priyadesign@aol.com'
WHERE `user_id` = 3;

--
-- Insert data into table `noelleaxalan_dmlsyntaxpractice.products`
-- 

INSERT INTO `noelleaxalan_dmlsyntaxpractice.products` (`product_id`, `product_name`, `category_id`, `brand`, `retail_price`, `cost_price`, `stock_quantity`)
VALUES (1, 'Laptop', 1, 'TechBrand', 899.99, 580.99, 10), (2, 'Headphones', 1, 'SoundMax', 199.99, 100.00, 25), (3, 'Monitor', 1, 'ViewBest', 275.00, 159.99,12), (4, 'Office Chair', 2, 'ComfortSeat', 150.00, 89.99, 5), (5, 'Standing Desk', 2, 'FlexiDesk', 320.00, 188.99, 7);

--
-- Insert data into table `noelleaxalan_dmlsyntaxpractice.orders`
-- 

INSERT INTO `noelleaxalan_dmlsyntaxpractice.orders` (`order_id`, `user_id`, `order_date`, `order_status`, `total_amount`)
VALUES(1,1, '2024-04-20', 'shipped', 1099.98), (2,2,'2024-04-21', 'delivered', 199.99), (3,3, '2024-02-22', 'processing', 155.50), (4, 1, '2024-04-25', 'delivered', 45.00), (5,4, '2024-04-26', 'shipped', 320.00);

--
-- Insert data into table `noelleaxalan_dmlsyntaxpractice.orderitems`
-- 

INSERT INTO `noelleaxalan_dmlsyntaxpractice.orderitems` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`)
VALUES (1, 1, 1, 1, 899.99), (2, 1, 2, 1, 199.99), (3, 2, 2, 1 , 199.99), (4, 3, 4, 1, 150.00), (5,3, 4, 1, 300.00);

--
-- Update retail price for Headphones in table `noelleaxalan_dmlsyntaxpractice.products`
-- 

UPDATE `noelleaxalan_dmlsyntaxpractice.products`
SET `retail_price` = 145.00
WHERE `product_id` = 2;

--
-- Table structure for table `noelleaxalan_dmlsyntaxpractice.payments`
-- 

CREATE TABLE `noelleaxalan_dmlsyntaxpractice.payments`
(
    `payment_id` INT64,
    `order_id` INT64,
    `card_type` STRING,
    `payment_status` STRING,
    `amount` NUMERIC,
    `payment_date` STRING,
    `transaction_id` STRING,
    PRIMARY KEY (`payment_id`) NOT ENFORCED,
    FOREIGN KEY (`order_id`) REFERENCES `noelleaxalan_dmlsyntaxpractice.orders`(`order_id`) NOT ENFORCED
);

--
-- Alter table `noelleaxalan_dmlsyntaxpractice.payments` to insert column `payment_method`
-- 

ALTER TABLE `noelleaxalan_dmlsyntaxpractice.payments`
ADD COLUMN `payment_method` STRING;

--
-- Insert data into table `noelleaxalan_dmlsyntaxpractice.payments`
-- 

INSERT INTO `noelleaxalan_dmlsyntaxpractice.payments` (`payment_id`, `order_id`, `payment_method`,`card_type`, `payment_status`, `amount`, `payment_date`, `transaction_id`)
VALUES (1, 1, 'Credit Card', 'Visa', 'completed', 199.98, '2024-04-20', 'txn-1001'), (2, 2, 'Paypal', NULL, 'completed', 199.99, '2024-04-21', 'txn-1002'), (3, 3, 'Credit Card', 'Mastercard', 'pending', 155.50, '2024-04-22', 'txn-1003'), (4, 4, 'Debit Card', 'Visa', 'completed', 45.00, '2024-04-25', 'txn-1004'), (5, 5, 'Credit Card', 'AMEX', 'pending', 320.00, '2024-04-26', 'txn-1005'), (6, 6, 'Paypal', NULL, 'completed', 18.25, '2024-04-27', 'txn-1006');

--
-- Delete entry 6 from table `noelleaxalan_dmlsyntaxpractice.payments`
-- 

DELETE FROM `noelleaxalan_dmlsyntaxpractice.payments`
WHERE `payment_id` = 6;

--
-- Table structure for table `noelleaxalan_dmlsyntaxpractice.reviews`
-- 

CREATE TABLE `noelleaxalan_dmlsyntaxpractice.reviews`
(
    `review_id` INT64,
    `user_id` INT64,
    `product_id` INT64,
    `rating` INT64,
    `review_text` STRING,
    `review_date` STRING,
    `is_verified_purchase` STRING,
    PRIMARY KEY (`review_id`) NOT ENFORCED,
    FOREIGN KEY (`user_id`) REFERENCES `noelleaxalan_dmlsyntaxpractice.users`(`user_id`) NOT ENFORCED,
    FOREIGN KEY (`product_id`) REFERENCES `noelleaxalan_dmlsyntaxpractice.products`(`product_id`) NOT ENFORCED
);

--
-- Table structure for table `noelleaxalan_dmlsyntaxpractice.reviews`
-- 

CREATE TABLE `noelleaxalan_dmlsyntaxpractice.addresses`
(
    `address_id` INT64,
    `user_id` INT64,
    `street` STRING,
    `apartment` STRING,
    `city` STRING, 
    `state` STRING,
    `country` STRING, 
    `zip_code` STRING,
    `is_primary` STRING,
    PRIMARY KEY (`address_id`) NOT ENFORCED,
    FOREIGN KEY (`user_id`) REFERENCES `noelleaxalan_dmlsyntaxpractice.users`(`user_id`) NOT ENFORCED
);

--
-- Insert data into table `noelleaxalan_dmlsyntaxpractice.reviews`
-- 

INSERT INTO `noelleaxalan_dmlsyntaxpractice.reviews` (`review_id`, `user_id`, `product_id`, `rating`, `review_text`, `review_date`, `is_verified_purchase`)
VALUES (1, 1, 1, 5, 'Great product!', '2024-04-25', 'TRUE'), (2, 2, 2, 4, 'Good quality', '2024-04-26', 'TRUE'), (3, 3, 4, 3, 'Average chair', '2024-04-27', 'TRUE'), (4, 4, 2, 5, 'Loved it!', '2024-04-28', 'FALSE');

--
-- Insert data into table `noelleaxalan_dmlsyntaxpractice.addresses`
-- 

INSERT INTO `noelleaxalan_dmlsyntaxpractice.addresses` (`address_id`, `user_id`, `street`, `apartment`, `city`, `state`, `country`, `zip_code`, `is_primary`)
VALUES (1, 1, '123 Main St', 'Apt 2', 'Denver', 'CO', 'USA', '80206', 'TRUE'), (2, 2, '456 Pine St', NULL, 'Seattle', 'WA', 'USA', '98101', 'TRUE'), (3, 3, '798 Oak Ave', 'Unit 5', 'Austin', 'TX', 'USA', '73301', 'TRUE'), (4, 4, '321 Lake Shore Dr', NULL, 'Chicago', 'IL', 'USA', '69691', 'TRUE');