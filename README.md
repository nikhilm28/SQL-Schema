# SQL-Schema

The above schema contains the required database tables to store data
of an E-Commerce Website.  
E-Commerce is a Web Application which is used to buy/sell the products. Using this platform Customer can buy the products from different seller with resonable price. Customer has freedom to give review or feedback about the product he has purchased from that site or customer can directly contact the seller. Customer can make payments in different types such as cash-on-delivery, net bankiing, etc. or he can avail EMI facility also.  Today E-Commerce is the biggest platform for doing business.


# Schema Tables:
	1) user_info 	:Contains the user/customer details, User can be "normal" user or "Admin" user
	
	2) category	:Category table contains the different categories of products

	3) product	:Product table includes the information of products such as name,price,description, etc

	4) product_mobile	:This table contains different properties of mobile such as ram,rom,cpu, etc. which can be used to filter the mobiles on cutomers requirement. 

	5) men_shirt		:This table contains different properties of Mens Shirts as brand,color,material,etc.

	6) ethinic_wear		:Table contains properties of Ethinic Wears such as brand,size,material, etc. 	

	7) seller	:Seller table contains the details of seller who are selling which products.

	8) order_info	:Order info contains the order details which customer has ordered.

	9) orderdetails	:Order details has information about the product_id, quantity

	10) cancelled_orders	:This table has details about the orders which are cancelled by customers.

	11) payment	:Payment table contains details about the payment type, amount, payment date, etc.

	12) transaction	:Transaction has details about the transaction id, payment id, order id and user id.

	13) shopping_cart	:Shopping cart contains the item details added by customer in his account.

	14) wishlist	:Wishlist contains the list of products which customer is willing to buy.

	15) review	:Review has the reviews or the feedback about the products.
	
	16) faq		:FAQ has questions and answers which are frequently asked by customer.

