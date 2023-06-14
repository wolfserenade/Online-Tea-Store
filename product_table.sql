CREATE TABLE product(
	product_id SERIAL PRIMARY KEY,
	name varchar,
	item_size_ounce int,
	tea_type varchar,
	brewing_type varchar,
	price decimal,
	inventory_amount int
	);
/* 
TODO:
- make tea_type into enum
- make packaging type into enum
*/