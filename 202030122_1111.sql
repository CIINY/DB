select * from customer;
select * from book;
select * from orders;

/*
�⺻Ű: customer
�⺻Ű: book
�⺻Ű: orders
    ����Ű: custoemrID, bookID
    
    custoemr -> orders, book -> orders
*/


/*�߸��ǰ� ������ ��.*/
select * from customer, orders;


/*����� ������ �� ��, join�� ��*/
select * from customer, orders
where customer.custid = orders.custid;


/*customerID�� PHONE�� ��µ��� �ʵ���. orders�� �ִ� custmerID�� �����
1.orderID
2. customerID
3. name
4. address
5.bookID
6.saleprice
7.orderdate
*/
select orderid, orders.custid, name, address, bookid
from customer, orders
where customer.custid = orders.custid
order by orders.custid;



select orderid, orders.custid, name, address, bookid, saleprice, orderdate
from customer, orders
where orders.custid = customer.custid
order by customer.custid;

