/* popular tea/ sold out*/
 WITH total_item_order AS
 (SELECT 
 	products.name,
 	SUM(orders.quantity) AS total_order
 FROM orders
 JOIN products
 ON orders.product_id = products.product_id
 Group by products.name)
 
 SELECT
 	products.name,
 	SUM(products.inventory - total_order)
 FROM products
 JOIN total_item_order
 ON total_item_order.name = products.name
 GROUP BY products.name
;

