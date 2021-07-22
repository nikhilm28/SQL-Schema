CREATE TABLE user_info 
(
    u_id	serial		NOT NULL,
    name 	varchar(20) 	NOT NULL,
    phone 	int 		NOT NULL,
    email 	varchar(20),
    address 	text 		NOT NULL,
    zipcode 	int 		NOT NULL,
    password 	varchar(20) 	NOT NULL,
    usertype 	varchar(10)	NOT NULL,
    PRIMARY KEY(u_id)
);

CREATE TABLE category
(
    cat_id 		serial 		NOT NULL,
    category_name 	varchar(30) 	NOT NULL,
    PRIMARY KEY(cat_id)
);

CREATE TABLE product 
(
    product_id 		serial		NOT NULL,
    name 		varchar(30) 	NOT NULL,
    description 	text		 NOT NULL,
    purchase_price 	int		 NOT NULL,
    qty 		int		 NOT NULL,
    discount		int		NOT NULL,
    cat_id	 	int		 NOT NULL,
    image	 	text		 	,
    PRIMARY KEY(product_id)			 ,
    FOREIGN KEY(cat_id) references category(cat_id)
);

CREATE TABLE product_mobile
(
	mob_id		serial		NOT NULL,
	brand		varchar(10)	NOT NULL,
	ram		int		NOT NULL,
	rom		int		NOT NULL,
	cpu		varchar(30)	NOT NULL,
	camera		int			,
	display		float		NOT NULL,
	product_id	int 		NOT NULL,
	PRIMARY KEY(mob_id)			,
	FOREIGN KEY(product_id) references product(product_id)
);

Create Table men_shirt
(
	shirt_id	serial		NOT NULL,
	brand		varchar(20)	NOT NULL,
	shirt_size	int		NOT NULL,
	color		varchar(20)	NOT NULL,
	collar		varchar(20)	NOT NULL,
	sleeve		varchar(20)	NOT NULL,
	material	varchar(20)	NOT NULL,
	product_id 	int 		NOT NULL,
	PRIMARY KEY(shirt_id)			,
	FOREIGN KEY(product_id) references product(product_id)
);

CREATE TABLE ethinic_wear
(
	ethinicwear_id	serial		NOT NULL,
	brand		varchar(20)	NOT NULL,
	wear_size	int 		NOT NULL,
	color		varchar(20)	NOT NULL,
	material	varchar(20)	NOT NULL,
	product_id	int 		NOT NULL,
	PRIMARY KEY(ethinicwear_id)			,
	FOREIGN KEY(product_id) references product(product_id)			
);



CREATE TABLE seller
(
    seller_id	int		NOT NULL,
    name	varchar(30)	NOT NULL,
    address	text		NOT NULL,
    product_id  int		NOT NULL,
    FOREIGN KEY(product_id) references product(product_id)
);

CREATE TABLE order_info 
(
    order_id 		serial 			NOT NULL,
    u_id 		int 			NOT NULL,
    order_date 		date 			NOT NULL,
    order_amount 	numeric		 	NOT NULL,
    total_amount 	int 			NOT NULL,
    seller_id 		int 			NOT NULL,
    PRIMARY KEY(order_id)				,
    FOREIGN KEY(u_id) references user_info(u_id) 
);

CREATE TABLE orderdetails
(
    orderinfo_id     integer               NOT NULL,
    item_id          integer               NOT NULL,
    quantity         integer               NOT NULL,
    PRIMARY KEY(orderinfo_id)
);

CREATE TABLE cancelled_orders
(
    cancelled_order_id    serial	NOT NULL,
    order_id		  int		NOT NULL,
    u_id		  int		NOT NULL,
    order_date            date			,
    PRIMARY KEY(cancelled_order_id,order_id,u_id),
    FOREIGN KEY(order_id) references order_info(order_id), 
    FOREIGN KEY(u_id) references user_info(u_id)
);


CREATE TABLE payment 
(
    pay_id	 serial		 	NOT NULL 	UNIQUE,
    pay_type	 varchar(30)		NOT NULL,
    amount	 numeric	 	NOT NULL,
    pay_date	 date		 	NOT NULL,
    pay_status	 varchar(30) 		NOT NULL,
    u_id	 int 			NOT NULL,
    order_id	 int 			NOT NULL,
    PRIMARY KEY(order_id)			,
    FOREIGN KEY(u_id) references user_info(u_id),
    FOREIGN KEY(order_id) references order_info(order_id)
);

ALTER TABLE payment ADD CONSTRAINT status_type CHECK (pay_status IN('pending', 'success','failure'));
ALTER TABLE payment ADD CONSTRAINT payment_type CHECK (pay_type IN('cash on delivery', 'net banking','UPI'));

CREATE TABLE transaction
(
   trans_id        serial	NOT NULL,
   pay_id	   int		NOT NULL,
   order_id        int		NOT NULL,
   u_id            int          NOT NULL,
   PRIMARY KEY(trans_id),
   FOREIGN KEY(order_id) references order_info(order_id), 
   FOREIGN KEY(pay_id) references payment(pay_id), 
   FOREIGN KEY(u_id) references user_info(u_id)
);

CREATE TABLE shopping_cart 
(
    cart_id 	serial		NOT NULL,
    product_id 	int			,
    qty 	int			,
    price 	numeric			,
    PRIMARY KEY(cart_id,product_id)	,
    CONSTRAINT fkey FOREIGN KEY(product_id) references product(product_id)
);

CREATE TABLE wishlist 
(
    id 		serial 		NOT NULL,
    u_id 	int			,
    product_id 	int			,
    insert_date date			, 
    PRIMARY KEY(id,u_id,product_id)	,
    FOREIGN KEY(u_id) references user_info(u_id), 
    FOREIGN KEY(product_id) references product(product_id)
);

CREATE TABLE review 
(
    product_id 		int 	NOT NULL,
    review 		text 	NOT NULL,
    u_id	 	int 	NOT NULL,
    PRIMARY KEY(u_id)			,
    CONSTRAINT fkey FOREIGN KEY(u_id) references user_info(u_id)
);

CREATE TABLE faq 
(
    id 		int 		NOT NULL,
    question 	text			,
    answer 	text			,
    PRIMARY KEY(id)
);	












