/* Creating and selecting the database */
Create database RetailChain;
use RetailChain;

/* Creating a table called "world" */
CREATE table products ( 
product_id int auto_increment,
low_fats enum('Y','N') NOT NULL,
recyclable enum('Y','N') NOT NULL,
PRIMARY KEY (product_id)
);

/* Adding information into the table we jsut created */ 
insert into products (low_fats, recyclable)
values 
	  ('Y', 'N'),
    ('Y', 'Y'),
    ('N', 'Y'), 
    ('Y', 'Y'),
    ('N','N');
    
/* Selecting the product_id that meets the requirements */ 
select product_id from Products where low_fats = 'Y' and recyclable = 'Y';

    
    
