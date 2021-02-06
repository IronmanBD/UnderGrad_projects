CREATE OR REPLACE FUNCTION thisMonthTotalCopySaleAll
	RETURN number IS
totalCopy number;

BEGIN

	select sum(ordd.quantity) into totalCopy from (select order_num, quantity from order_details) ordd 
		inner join (select order_num from orders 
		where to_char( sysdate, 'mm' ) = to_char( orders.order_date, 'mm' ) and 
			to_char( sysdate, 'yyyy') = to_char( orders.order_date, 'yyyy')) ord on ord.order_num = ordd.order_num;
	RETURN totalCopy;
END;
/