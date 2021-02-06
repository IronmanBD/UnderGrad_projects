CREATE OR REPLACE PROCEDURE customerBoughtBooksAll
	(var_custNum in number) IS

cursor c is select cust_name, order_date, book_title from (select order_num, order_date, cust_name from orders) ord 
	inner join (select order_num, book_num from order_details@site_link_dhaka) ordd on ord.order_num = ordd.order_num 
	inner join (select cust_num, cust_name from customers@site_link_dhaka where cust_num = var_custNum) cus on cus.cust_num = ord.cust_num 
	inner join (select book_num, book_title from books) bo on bo.book_num = ordd.book_num;

var_c c%ROWTYPE;

BEGIN

dbms_output.put_line( chr(9) );

open c;

  loop
    fetch c into var_c;
    exit when c%notfound;

    dbms_output.put_line('Customer = ' || var_c.cust_name || ' Book = ' || var_c.book_title || ' Order Date = ' || var_c.order_date);
  end loop;

  close c;
END;
/