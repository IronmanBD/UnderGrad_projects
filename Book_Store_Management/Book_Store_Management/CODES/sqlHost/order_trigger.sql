set serveroutput on;
create or replace trigger order_trigger
after insert or update or delete on ORDERS
for each row
begin
	dbms_output.put_line('Orders have been Changed');
end;
/