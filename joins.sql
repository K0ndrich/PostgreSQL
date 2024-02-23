
SELECT my_col1 , my_tab2.my_col2 FROM my_tab1   -- my_tab2.my_col2 - нужно указывать, если ето название есть в более чем одной таблице
INNER JOIN my_tab2   -- тип соединение и с какой таблицей соединяем 
ON my_col3 = my_tab2.my_col3   -- условие соединения -> внутренние ключи из правой таблици равны из вншеними из правой таблици  
GROUP BY / ORDER BY / WHERE / HAVING / LIMIT   -- добавляем условий
           -- INNER JOIN = JOIN  -- нету разници

-----  INNER JOIN  - 2 TABLES  --------------------------------------------------------------------------------------
SELECT product_name, suppliers.company_name, units_in_stock 
FROM products 
INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
ORDER BY units_in_stock DESC



SELECT category_name , SUM(products.units_in_stock) FROM products
INNER JOIN categories ON products.category_id = categories.category_id
GROUP BY category_name
ORDER BY SUM(products.units_in_stock) DESC
LIMIT 5



SELECT categories.category_name , SUM(unit_price *units_in_stock ) FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE discontinued <>1
GROUP BY categories.category_name
HAVING SUM(unit_price *units_in_stock ) > 5000
ORDER BY SUM(unit_price *units_in_stock ) DESC



SELECT order_id, customer_id , first_name , last_name , title 
FROM orders
INNER JOIN employees ON orders.employee_id = employees.employee_id


----- INNER JOIN - MANY TABLES  -----------------------------------------------------------------------------------------------
SELECT order_date, product_name, ship_country, products.unit_price, quantity, discount 
FROM orders
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.product_id



SELECT contact_name , company_name , phone , first_name , last_name, title , 
	order_date,product_name , ship_country , products.unit_price , discount	
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
JOIN customers ON orders.customer_id = customers.customer_id
JOIN employees ON orders.employee_id = employees.employee_id


SELECT customers.company_name , CONCAT(first_name ,' ' ,last_name) AS full_name
FROM orders AS o
JOIN customers USING (customer_id)
JOIN employees USING (employee_id)
JOIN shippers AS s ON o.ship_via = s.shipper_id 
WHERE customers.city = 'London' AND employees.city = 'London' AND s.company_name ='Speedy Express'


SELECT product_name, units_in_stock , contact_name , phone 
FROM products
JOIN categories USING (category_id)
JOIN suppliers USING (supplier_id)
WHERE category_name IN ('Beverages','Seafood') AND discontinued=0 AND units_in_stock < 20
ORDER BY units_in_stock ASC

----- LEFT JOIN - 2 TABLES -----------------------------------------------------------------------

SELECT company_name,product_name 
FROM suppliers
LEFT JOIN products ON suppliers.supplier_id = products.product_id


SELECT company_name, order_id FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL


SELECT  last_name , first_name, order_id
FROM employees
LEFT JOIN orders ON employees.employee_id = orders.employee_id
WHERE order_id IS NULL


SELECT contact_name , company_name , order_id 
FROM customers
LEFT JOIN orders USING(customer_id)
WHERE order_id IS NULL

----- RIGHT JOIN - 2 TABLES ------------------------------------------------------------------------------

SELECT company_name , order_id 
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL

----- FULL JOIN - 2 TABLES ---------------------------------------------------------------------

SELECT company_name , order_id 
FROM orders
FULL JOIN customers ON orders.customer_id = customers.customer_id


----- SELF JOIN - 1 TABLE -> внешний ключ ссылаеться на первичный ключ в етой же таблице -------------------------------------------------------------------------------

CREATE TABLE employee(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	manager_id INT,
	FOREIGN KEY(manager_id) REFERENCES employee(employee_id)
);
INSERT INTO employee(
	employee_id,
	first_name,
	last_name,
	manager_id
)
VALUES 
(1,'first1','last1', NULL),
(2,'first2','last2',1),
(3,'first3','last3',1),
(4,'first4','last4',2),
(5,'first5','last5',2),
(6,'first6','last6',3),
(7,'first7','last7',3),
(8,'first8','last8',3);


SELECT e.first_name || ' ' || e.last_name AS employee, -- вывод двох колонок как одну
	   m.first_name || ' ' || m.last_name AS manager 
FROM employee e  -- даем псевдоним для таблици
LEFT JOIN employee m ON m.employee_id = e.manager_id  -- LEFT JOIN





