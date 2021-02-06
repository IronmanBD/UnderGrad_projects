CREATE OR REPLACE FUNCTION thisMonthIncomeAll
	RETURN number IS
totalIncome number;

BEGIN

	select sum(bo.price*ordd.quantity) into totalIncome from (select book_num, price from books) bo 
		inner join (select book_num, quantity, order_num from order_details) ordd on bo.book_num = ordd.book_num 
		inner join (select order_date, order_num from orders
			where to_char( sysdate, 'mm' ) = to_char( orders.order_date, 'mm' ) 
			and to_char( sysdate, 'yyyy') = to_char( orders.order_date, 'yyyy')) ord on ord.order_num = ordd.order_num;

	RETURN totalIncome;
END;
/