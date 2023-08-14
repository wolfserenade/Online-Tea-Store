/*top five tea that was ordered by the most number of unique individuals*/
WITH top_five_tea AS(
	SELECT 
	orders.product_id,
	COUNT(distinct orders.customer_id) AS unqiue_customer_count
FROM orders
GROUP BY orders.product_id
order by unqiue_customer_count DESC
limit 5
)

SELECT products.product_id,
	products.name,
	top_five_tea.unqiue_customer_count
FROM products
join top_five_tea on products.product_id = top_five_tea.product_id
;

/*This query does not include unique_customer_count with the same rank. Will include window func`tion dense_rank below*/

WITH top_five_tea AS (
SELECT 
	orders.product_id,
	COUNT(distinct orders.customer_id) AS unqiue_customer_count,
	DENSE_RANK()OVER(ORDER BY COUNT(distinct orders.customer_id) DESC) AS RNK
FROM orders
GROUP BY orders.product_id
)
SELECT products.product_id,
	products.name,
	top_five_tea.unqiue_customer_count,
	RNK
FROM products
JOIN top_five_tea on products.product_id = top_five_tea.product_id
WHERE RNK <= 5
order by RNK