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

# Ubacivanje M1 Abramsa i brisanje istoga

select * from productlines;

insert into productlines (productLine,textDescription) values 
('Armored Personel Carriers','For safe journey in dangerous neighbourhoods'),
('Tanks','Sometimes you need a bit more protection than APC');

insert into products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) values
('S91_1920','M1 Abrams','Tanks','1:20','Classic Metal Creations','Relatively large replica of M1 Abrams Tank, ammunition not included',4000,500.99,125.21);

select * from products where productName='M1 Abrams';

delete from products where productCode='S91_1920';
delete from productlines where productLine='Armored Personel Carriers';
delete from productlines where productLine='Tanks';



