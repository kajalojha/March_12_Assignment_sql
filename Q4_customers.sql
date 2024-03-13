use avisoft;
create table customers (
    customer_id int PRIMARY KEY,
    name varchar(255)
);
insert into customers (customer_id, name) values
(1, 'Alice'),
(2, 'Bob'),
(3, 'Tom'),
(4, 'Jerry'),
(5, 'John');

create table ordersn (
    order_id int PRIMARY KEY,
    order_date date,
    customer_id int,
    product_id int
);
insert into ordersn (order_id, order_date, customer_id, product_id) values
(1, '2020-07-31', 1, 1),
(2, '2020-07-30', 2, 2),
(3, '2020-08-29', 3, 3),
(4, '2020-07-29', 4, 1),
(5, '2020-06-10', 1, 2),
(6, '2020-08-01', 2, 1),
(7, '2020-08-01', 3, 3),
(8, '2020-08-03', 1, 2),
(9, '2020-08-07', 2, 3),
(10, '2020-07-15', 1, 2);
 create table productsn (
    product_id int,
    product_name varchar(255),
    price int
);
insert into productsn (product_id, product_name, price) values
(1, 'keyboard', 120),
(2, 'mouse', 80),
(3, 'screen', 600),
(4, 'hard disk', 450);
SELECT 
    op.customer_id,
    op.product_id,
    p.product_name
FROM 
    (
        SELECT 
            customer_id, 
            product_id, 
            COUNT(*) AS order_count
        FROM 
            Ordersn
        GROUP BY 
            customer_id, product_id
    ) AS op
JOIN 
    Productsn AS p ON op.product_id = p.product_id
JOIN 
    (
        SELECT 
            customer_id, 
            MAX(order_count) AS max_order_count
        FROM 
            (
                SELECT 
                    customer_id, 
                    product_id, 
                    COUNT(*) AS order_count
                FROM 
                    Ordersn
                GROUP BY 
                    customer_id, product_id
            ) AS t
        GROUP BY 
            customer_id
    ) AS max_count ON op.customer_id = max_count.customer_id AND op.order_count = max_count.max_order_count;

