CREATE OR REPLACE PROCEDURE insertOrderKhulna
	(var_orderNum in number, var_custNum in number, var_date in date, var_bookNum in number, var_quantity in number) IS

BEGIN

	insert into orders@site_link_khulna values (var_custNum, var_orderNum, var_date);
	insert into order_details@site_link_khulna values (var_orderNum, var_bookNum, var_quantity);

END;
/