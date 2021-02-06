CREATE OR REPLACE PROCEDURE insertDataSiteDhaka IS

cursor cCustomer is select * from customers where city = 'Dhaka';
varCustomer cCustomer%ROWTYPE;
cursor cOrder is SELECT * FROM orders WHERE EXISTS (SELECT * FROM customers WHERE customers.cust_num = orders.cust_num AND customers.city = 'Dhaka');
varOrder cOrder%ROWTYPE;
cursor cOrderDetail is SELECT * FROM order_details WHERE EXISTS (SELECT * FROM orders WHERE EXISTS (SELECT * FROM customers WHERE orders.order_num = order_details.order_num AND customers.cust_num = orders.cust_num AND customers.city = 'Dhaka'));
varOrderDetail cOrderDetail%ROWTYPE;
cursor cAuthor is select * from authors;
varAuthor cAuthor%ROWTYPE;
cursor cGenre is select * from genres;
varGenre cGenre%ROWTYPE;
cursor cPublisher is select * from publishers;
varPublisher cPublisher%ROWTYPE;
cursor cSupplier is select * from suppliers;
varSupplier cSupplier%ROWTYPE;
cursor cBook is select * from books;
varBook cBook%ROWTYPE;
cursor cStock is select * from stocks;
varStock cStock%ROWTYPE;


BEGIN

open cAuthor;
	
	loop
    		fetch cAuthor into varAuthor;
    		exit when cAuthor%notfound;

		insert into authors@site_link_dhaka values (varAuthor.author_num, varAuthor.author_name);
	
  	end loop;

close cAuthor;
open cPublisher;

	loop
    		fetch cPublisher into varPublisher;
    		exit when cPublisher%notfound;

		insert into publishers@site_link_dhaka values (varPublisher.pub_num, varPublisher.pub_name);
	
  	end loop;

close cPublisher;
open cSupplier;

	loop
    		fetch cSupplier into varSupplier;
    		exit when cSupplier%notfound;

		insert into suppliers@site_link_dhaka values (varSupplier.sup_num, varSupplier.sup_name, varSupplier.sup_city, varSupplier.sup_email, varSupplier.sup_phone);
	
  	end loop;

close cSupplier;
open cGenre;

	loop
    		fetch cGenre into varGenre;
    		exit when cGenre%notfound;

		insert into genres@site_link_dhaka values (varGenre.genre_num, varGenre.genre_title);
	
  	end loop;

close cGenre;
open cCustomer;

	loop
    		fetch cCustomer into varCustomer;
    		exit when cCustomer%notfound;
		
		insert into customers@site_link_dhaka values (varCustomer.cust_num, varCustomer.cust_name, varCustomer.email, varCustomer.password, varCustomer.phone_number, varCustomer.city, varCustomer.street, varCustomer.building);
  	end loop;

close cCustomer;
open cBook;

	loop
    		fetch cBook into varBook;
    		exit when cBook%notfound;

		insert into books@site_link_dhaka values (varBook.book_num, varBook.book_title, varBook.author_num, varBook.pub_num, varBook.genre_num, varBook.publication_date, varBook.edition, varBook.price, varBook.sup_num);
	
  	end loop;

close cBook;
open cOrder;

	loop
    		fetch cOrder into varOrder;
    		exit when cOrder%notfound;

		insert into orders@site_link_dhaka values (varOrder.cust_num, varOrder.order_num, varOrder.order_date);
	
  	end loop;

close cOrder;
open cOrderDetail;

	loop
    		fetch cOrderDetail into varOrderDetail;
    		exit when cOrderDetail%notfound;
			
		insert into order_details@site_link_dhaka values (varOrderDetail.order_num, varOrderDetail.book_num, varOrderDetail.quantity);
	
  	end loop;

close cOrderDetail;
open cStock;

	loop
    		fetch cStock into varStock;
    		exit when cStock%notfound;

		insert into stocks@site_link_dhaka values (varStock.book_num, varStock.quantity);
	
  	end loop;

close cStock;
commit;
END;
/