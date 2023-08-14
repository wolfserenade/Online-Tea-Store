 WITH total_product_order_quantity AS
 (SELECT
 	product_id,
 	SUM(quantity) AS total_quantity
 FROM orders
 Group by product_id
 )
 
 SELECT
 	products.product_id,
 	products.name,
 	products.inventory_amount - total_product_order_quantity.total_quantity as remaining_inventory
 FROM products
 JOIN total_product_order_quantity ON total_product_order_quantity.product_id = products.product_id
 where products.inventory_amount - total_product_order_quantity.total_quantity <= 0
 order by remaining_inventory asc;