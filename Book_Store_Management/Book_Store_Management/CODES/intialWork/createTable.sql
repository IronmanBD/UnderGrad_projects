clear screen;

DROP TABLE BOOKS CASCADE CONSTRAINTS;
DROP TABLE GENRES CASCADE CONSTRAINTS;
DROP TABLE AUTHORS CASCADE CONSTRAINTS;
DROP TABLE PUBLISHERS CASCADE CONSTRAINTS;
DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAILS CASCADE CONSTRAINTS;
DROP TABLE STOCKS CASCADE CONSTRAINTS;
DROP TABLE SUPPLIERS CASCADE CONSTRAINTS;



CREATE TABLE AUTHORS(
	author_num number,
	author_name varchar(50),
	primary key(author_num)
);

CREATE TABLE GENRES(
	genre_num number,
	genre_title varchar(50),
	primary key(genre_num)
);

CREATE TABLE PUBLISHERS(
	pub_num number,
	pub_name varchar(30),
	primary key(pub_num)
);
CREATE TABLE SUPPLIERS(
	sup_num number,
	sup_name varchar(55) ,
    sup_City varchar(55),
	sup_email varchar(55),
	sup_phone varchar(55),
    Primary key (sup_num)
);

CREATE TABLE BOOKS(
   book_num number,
   book_title varchar(50),
   author_num number,
   pub_num number,
   genre_num number,
   publication_date date,
   edition number,
   price number,
   sup_num number,
   primary key(book_num),
   CONSTRAINT FK_BOOKS FOREIGN KEY (pub_num) REFERENCES PUBLISHERS(pub_num),
   CONSTRAINT FK_BOOKS1 FOREIGN KEY (author_num) REFERENCES AUTHORS(author_num),
   CONSTRAINT FK_BOOKS2 FOREIGN KEY (genre_num) REFERENCES GENRES(genre_num),
   CONSTRAINT FK_BOOKS3 FOREIGN KEY (sup_num) REFERENCES SUPPLIERS(sup_num)
);


CREATE TABLE CUSTOMERS(
	Cust_num number,
	Cust_name varchar(50),
	email varchar(50),
	password varchar(30),
	phone_number varchar(30),
	city varchar(20),
	street varchar(20),
	building varchar(20),
	primary key(Cust_num)
);
CREATE TABLE ORDERS(
	cust_num number,
	order_num number,
	order_date date,
	primary key(order_num),
	CONSTRAINT FK_ORDERS FOREIGN KEY (Cust_num)
        REFERENCES CUSTOMERS(Cust_num)
	);
CREATE TABLE ORDER_DETAILS(
    order_num number,
	book_num number,
	quantity number,
    primary key(order_num,book_num),
	CONSTRAINT FK_ORDERS_DETAILS1 FOREIGN KEY (book_num)
    REFERENCES BOOKS(book_num),
	CONSTRAINT FK_ORDER_DETAILS2 FOREIGN KEY (order_num)
    REFERENCES ORDERS(order_num)
);
CREATE TABLE STOCKS(
	book_num number,
	quantity number,
    primary key(book_num),
	CONSTRAINT FK_STOCK1 FOREIGN KEY (book_num)
    REFERENCES BOOKS(book_num)
);


commit;




