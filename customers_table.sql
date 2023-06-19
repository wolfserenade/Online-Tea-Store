 CREATE TABLE customers(
 	customer_id SERIAL PRIMARY KEY,
 	first_name varchar,
 	last_name varchar,
 	phone_number varchar,
 	email varchar NOT NULL
 );
