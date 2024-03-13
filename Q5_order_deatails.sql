use avisoft;
CREATE TABLE OrdersDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES
(1, 1, 12),
(1, 2, 10),
(1, 3, 15),
(2, 1, 8),
(2, 4, 4),
(2, 5, 6),
(3, 3, 5),
(3, 4, 18),
(4, 5, 2),
(4, 6, 8),
(5, 7, 9),
(5, 8, 9),
(3, 9, 20),
(2, 9, 4);


SELECT 
    order_id
FROM (
    SELECT 
        order_id,
        SUM(quantity) / COUNT(DISTINCT product_id) AS avg_quantity,
        MAX(quantity) AS max_quantity
    FROM OrdersDetails
    GROUP BY order_id
) AS OrderStats
WHERE max_quantity > ALL (
    SELECT 
        SUM(quantity) / COUNT(DISTINCT product_id)
    FROM OrdersDetails
    GROUP BY order_id
);