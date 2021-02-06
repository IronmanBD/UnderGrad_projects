CREATE OR REPLACE PROCEDURE showTopAuthorsAllFromSite IS

cursor c is select aut.author_num as id, aut.author_name as name, sum(ordd.quantity) as quan from (select quantity, book_num from order_details@site_link_dhaka union select quantity, book_num from order_details@site_link_khulna) ordd 
	inner join (select book_num, author_num from books@site_link_dhaka union select book_num, author_num from books@site_link_khulna) bo on ordd.book_num=bo.book_num 
	inner join (select author_num, author_name from authors@site_link_dhaka union select author_num, author_name from authors@site_link_khulna) aut on aut.author_num=bo.author_num 
	group by (aut.author_num, aut.author_name) 
	order by (sum(ordd.quantity)) desc;

var_c c%ROWTYPE;

BEGIN

dbms_output.put_line( chr(9) );

open c;

  loop
    fetch c into var_c;
    exit when c%notfound;

    dbms_output.put_line('Author Name = ' || var_c.name || ' Quantity = ' || var_c.quan);
  end loop;

  close c;
END;
/