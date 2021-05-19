# Baza classicmodels
# Prvo redo malo naredbe

select * from customers;

select contactLastName, contactFirstName, phone from customers;

select * from employees;

select lastName, firstName email, jobTitle from employees;

select * from employees;

select jobtitle as posao, firstName, lastName from employees;

# Svi dobili otkaz
select firstName, lastName, 'Just fired' as jobTitle from employees;

select now ();

# Postoji zaposlenik
select * from employees where employeeNumber=1056;

# Ne postoji zaposlenik
select * from employees where employeeNumber=1049;

select * from employees where employeeNumber < 1500;

select * from orders;

# Ok, dobio sve manje ili jednako od 10200
select * from orders where orderNumber <= 10200;

# Sve manje od 10200
select * from orders where orderNumber <10200;

# Sve osim 10200
select * from orders where orderNumber !=10200;

# Sve vise/manje od 10200
select * from orders where orderNumber <>10200;

select * from payments;

select * from payments where customerNumber>=120 and customerNumber<= 150;

select * from payments where not amount < 20000.00;

select * from products;

select * from products where productName='1968 Dodge Charger';

select * from products where productName like 'D%';

select * from products where productName like '%Dodge%';

