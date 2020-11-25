select * from customer;
select * from book;
select * from orders;

/*
기본키: customer
기본키: book
기본키: orders
    참조키: custoemrID, bookID
    
    custoemr -> orders, book -> orders
*/


/*잘못되게 가져온 것.*/
select * from customer, orders;


/*제대로 가지고 온 예, join을 함*/
select * from customer, orders
where customer.custid = orders.custid;


/*customerID와 PHONE은 출력되지 않도록. orders에 있는 custmerID를 사용함
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

