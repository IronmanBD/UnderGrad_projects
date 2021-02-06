/* R JN (S JN T) -> (R JN S) JN T */

CREATE OR REPLACE PROCEDURE proofAssociative IS

cursor t1 is select * from order_details 
	inner join (select * from orders inner join customers on customers.cust_num = orders.cust_num) cus_ord on cus_ord.order_num = order_details.order_num;
cursor t2 is select * from (select * from order_details inner join orders on order_details.order_num = orders.order_num) ord_ordd 
	inner join customers on customers.cust_num = ord_ordd.cust_num;

var_t1 t1%ROWTYPE;
var_t2 t2%ROWTYPE;
tot_row1 number := 0;
tot_row2 number := 0;

BEGIN

dbms_output.put_line( chr(9) );
open t1;

  loop
    fetch t1 into var_t1;
    exit when t1%notfound;

    dbms_output.put_line('Customer = ' || var_t1.cust_name || ' Book = ' || var_t1.book_num || ' Order Date = ' || var_t1.order_date);
	tot_row1 := tot_row1 + 1;
  end loop;

  dbms_output.put_line('Total Rows : ' || tot_row1);

close t1;

open t2;

  loop
    fetch t2 into var_t2;
    exit when t2%notfound;

    dbms_output.put_line('Customer = ' || var_t2.cust_name || ' Book = ' || var_t2.book_num || ' Order Date = ' || var_t2.order_date);
	tot_row2 := tot_row2 + 1;
  end loop;

  dbms_output.put_line('Total Rows : ' || tot_row2);
close t2;

END;
/