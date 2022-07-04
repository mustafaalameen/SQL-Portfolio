/*this is a practice query script foe the topic VIEWS in SQL*/
use sakila; /*i used the sakila database*/
1. A view can be created with the CREATE VIEW view_name forma single table.;
/*Suppose we're to ceate a view from the customer table with the selected fields, the syntax will be as follows:*/

CREATE VIEW customer_vw
(customer_id, full_name, email)
AS
SELECT customer_id, concat(first_name," ",last_name) full_name, email
FROM customer;

/* you can view all the columns the vw*/
select * from customer_vw;

2.	A view can be created with the CREATE VIEW view_name from multiple table.;
Suppose we are to create a view from the customer table joined with the payment table for the selected fields, the syntax will be as follows;
CREATE VIEW customer_payment_vw
(customer_id, full_name, email, sum_paid)
AS
SELECT c.customer_id, concat(c.first_name," ",c.last_name) full_name, c.email, sum(p.amount) Amount_paid
FROM customer c
INNER JOIN payment p
on c.customer_id= p.customer_id
GROUP BY p.customer_id
;

/* you can view all the columns the customer_payment_vw*/
select * from customer_payment_vw ;


4.	Delete the customer_vw view from the database;
DROP VIEW customer_vw;