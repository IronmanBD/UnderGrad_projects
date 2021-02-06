/* R JN S -> S JN R */

CREATE OR REPLACE PROCEDURE proofCommutative IS

cursor t1 is select * from orders
	inner join customers on customers.cust_num = orders.cust_num;
cursor t2 is select * from customers 
	inner join orders on customers.cust_num = orders.cust_num;

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

    dbms_output.put_line( ' Order = ' || var_t1.order_num || ' Order Date = ' || var_t1.order_date);
	tot_row1 := tot_row1 + 1;
  end loop;
  
  dbms_output.put_line('Total Rows : ' || tot_row1);

close t1;


open t2;

  loop
    fetch t2 into var_t2;
    exit when t2%notfound;

    dbms_output.put_line( ' Order = ' || var_t2.order_num ||  ' Order Date = ' || var_t2.order_date);
	tot_row2 := tot_row2 + 1;
  end loop;
  
  dbms_output.put_line('Total Rows : ' || tot_row2);

close t2;

END;
/