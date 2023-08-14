CREATE TABLE orders(
	order_id uuid PRIMARY KEY,
	customer_id uuid,
	product_id uuid,
	unit_price decimal,
	quantity int,
	CONSTRAINT fk_customers
    	FOREIGN KEY (customer_id)
      	REFERENCES customers(customer_id),
  	CONSTRAINT fk_products
    	FOREIGN KEY (product_id)
      	REFERENCES products(product_id)
);