CREATE OR REPLACE PROCEDURE showTopSellingBooksAll IS

cursor c is select ordd.book_num as id, bo.book_title as title, sum(ordd.quantity) as quan from (select book_num, quantity from order_details) ordd
	inner join (select book_num, book_title from books) bo on ordd.book_num=bo.book_num 
	group by (ordd.book_num, bo.book_title)
	order by (sum(ordd.quantity)) desc;

var_c c%ROWTYPE;


BEGIN

dbms_output.put_line( chr(9) );

open c;

  loop
    fetch c into var_c;
    exit when c%notfound;

    dbms_output.put_line('Book Name = ' || var_c.title || ' Quantity = ' || var_c.quan);
  end loop;

  close c;
END;
/