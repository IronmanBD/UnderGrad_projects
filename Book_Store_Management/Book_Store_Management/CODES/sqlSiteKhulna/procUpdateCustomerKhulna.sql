CREATE OR REPLACE PROCEDURE updateCustomerKhulna
	(var_custNum in number, var_custName in varchar, var_email in varchar, var_password in varchar, var_phoneNumber in varchar, var_city in varchar, var_building in varchar) IS

BEGIN

	update customers@site_link_khulna 
		set cust_name = var_custName, email = var_email, password = var_password, 
			phone_number = var_phoneNumber, city = var_city, building = var_building where cust_num = var_custNum;

END;
/