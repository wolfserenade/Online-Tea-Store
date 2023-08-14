CREATE TABLE customers_addresses(
	customer_id uuid,
	address_id uuid,
	CONSTRAINT fk_customers
    	FOREIGN KEY (customer_id)
      	REFERENCES customers(customer_id),
  	CONSTRAINT fk_addresses
    	FOREIGN KEY (address_id)
      	REFERENCES addresses(address_id),
    UNIQUE(customer_id, address_id)
);
