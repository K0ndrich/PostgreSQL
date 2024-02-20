
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