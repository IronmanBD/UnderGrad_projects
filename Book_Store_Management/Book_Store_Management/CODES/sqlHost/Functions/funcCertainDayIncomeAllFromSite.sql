CREATE OR REPLACE FUNCTION dayIncomeAllFromSite
	(var_date in date)
	RETURN number IS
totalIncome number;

BEGIN

	select sum(bo.price*ordd.quantity) into totalIncome from (select book_num, price from books@site_link_khulna union select book_num, price from books@site_link_dhaka) bo 
		inner join (select book_num, quantity, order_num from order_details@site_link_khulna union select book_num, quantity, order_num from order_details@site_link_dhaka) ordd on bo.book_num = ordd.book_num 
		inner join (select order_date, order_num from orders@site_link_khulna union select order_date, order_num from orders@site_link_dhaka 
			where to_char( var_date, 'dd' ) = to_char( orders.order_date, 'dd' ) and 
			to_char( var_date, 'mm' ) = to_char( orders.order_date, 'mm' ) and 
			to_char( var_date, 'yyyy') = to_char( orders.order_date, 'yyyy')) ord on ord.order_num = ordd.order_num;
	RETURN totalIncome;
END;
/