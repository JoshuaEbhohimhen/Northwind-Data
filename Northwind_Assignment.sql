use northwind;
-- 1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
select CategoryName, Description
from categories
order by CategoryName;

-- 2.  Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sort by Phone.
select ContactName, CompanyName, ContactTitle, Phone
from customers
order by Phone;

-- 3.Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname 
-- respectively and HireDate from the employees table sorted from the newest to the oldest employee.
select upper(FirstName) as 'First Name', upper(LastName) as 'Last Name', HireDate
from employees
order by EmployeeID desc;

-- 4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted
-- by Freight in descending order.
select OrderID, OrderDate, ShippedDate, CustomerID, Freight
from orders
order by Freight desc;

-- 5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
select lower(CustomerID) as ID
from customers;

-- 6.  Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the 
-- Country in descending order then by CompanyName in ascending order.
select CompanyName, Fax, Phone, Country, HomePage 
from suppliers
order by Country desc, CompanyName asc;

-- 7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.
select CompanyName, ContactName, City
from customers 
where City like '%Buenos Aires%';

-- 8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
select ProductName, UnitPrice, QuantityPerUnit
from products
where UnitsInStock = 0;

-- 9. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
select ContactName, Address, City, Country
from customers
where Country not in ('Germany', 'Mexico', 'Spain');

-- 10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
select OrderDate, ShippedDate, CustomerID, Freight
from orders
where Orderdate = '1996-05-21';

-- 11. Create a report showing FirstName, LastName, Country from the employees not from United States.
select FirstName, LastName, Country
from employees
where Country not in ('United State');

-- **12.  Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later
-- than the required date.
select EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
from orders;


-- 13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
select City, CompanyName, ContactName
from customers
where City like 'A%' or City like 'B%';

-- 14. Create a report showing all the even numbers of OrderID from the orders table.
select OrderID
from orders
where (OrderID % 2) = 0;

-- 15. Create a report that shows all the orders where the freight cost more than $500.
select *
from orders
where freight >= 500;

-- 16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for 
-- reorder.
select ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
from products
where UnitsOnOrder > 0;

-- 17. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.
select CompanyName, ContactName
from customers
where Fax is null;

-- 18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
select FirstName, LastName
from employees
where ReportsTo is null;

-- 19. Create a report showing all the odd numbers of OrderID from the orders table.
select OrderID
from orders
where (OrderID % 2) > 0;

-- 20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted 
-- by ContactName
select CompanyName, ContactName, Fax
from customers
where Fax is null
order by ContactName;

-- 21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name
-- sorted by ContactName.
select City, CompanyName, ContactName
from customers
where City like '%L%';

-- 22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s
select FirstName, LastName, BirthDate
from employees
where BirthDate between '1950-01-01' and '1959-12-31';

-- 23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
 select FirstName, LastName, year(BirthDate) as 'Birth Year'
 from employees;
 
-- 24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by 
-- OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement.
select OrderID, sum(OrderID) as 'Number of Orders'
from orders
group by OrderID
order by sum(OrderID) desc;

-- 25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids,
-- Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
select s.SupplierID, p.ProductName, s.CompanyName
from products p
join suppliers s on p.SupplierID = s.SupplierID
where s.CompanyName like '%Exotic Liquids%' or s.CompanyName like '%Specialty Biscuits%' or s.CompanyName like '%Escargots Nouveaux%'
order by s.SupplierID;

-- 26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders 
-- with ShipPostalCode beginning with "98124".
select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
from orders
having shipPostalCode like '98124%';

-- 27.  Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.
select ContactName, ContactTitle, CompanyName
from customers
where ContactTitle not like '%Sales%';

-- 28. Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle";
select LastName, FirstName, City
from employees
where City like 'Seattle';

-- 29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other 
-- cities in Spain other than Madrid.
select CompanyName, ContactTitle, City, Country
from customers
where City not like 'Madrid';

-- 30. Create a select statement that outputs the following:
select concat(FirstName," ", LastName, " ", "can be reached at x", Extension) as 'Contact Info'
from employees; 

-- 31. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
select ContactName
from customers
where ContactName not like '_A%';

-- 32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and 
-- maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively

select round(avg(UnitPrice)) as 'Average Price', sum(UnitsInStock) as 'Total Stock', max(UnitsOnOrder) as 'Max Order'
from products;
 
-- 33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, 
-- suppliers and categories table.
select s.SupplierID, s.CompanyName, c.CategoryName, p.ProductName, p.UnitPrice
from products p
join suppliers s on p.SupplierID = s.SupplierID
join categories c on p.CategoryID = c.CategoryID;

-- 34. Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped 
-- by CustomerID. HINT: you will need to use a Groupby and a Having statement.
select CustomerID, sum(Freight)
from orders
group by CustomerID 
having sum(Freight) > 200;

-- 35.  Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and 
-- customers table with discount given on every purchase.
select o.OrderID, c.ContactName, od.UnitPrice, od.Quantity, od.Discount
from customers c
join orders o on o.CustomerID = c.CustomerID
join `order details` as od on od.OrderID = o.OrderID;

-- 36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of 
-- who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin

select e.EmployeeID, concat(em.LastName, " ", em.FirstName) as employee, concat(e.LastName, " ", e.FirstName) as manager
from employees as e
join employees as em on em.ReportsTo = e.EmployeeID
order by EmployeeID;

-- 37.  Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice 
-- and MaximumPrice respectively.
select avg(UnitPrice) as AveragePrice, min(UnitPrice) as MinimumPrice, max(UnitPrice) as MaximumPrice
from products;

-- 38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, 
-- Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View.

create view CustomerInfo as 
select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address, c.City, c.Country, c.Phone, o.OrderDate, o.RequiredDate, o.ShippedDate
from customers c
join orders o on c.CustomerID = o.CustomerID;

-- 39. Change the name of the view you created from customerinfo to customer details.
drop view CustomerInfo;

create view CustomerDetails as 
select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address, c.City, c.Country, c.Phone, o.OrderDate, o.RequiredDate, o.ShippedDate
from customers c
join orders o on c.CustomerID = o.CustomerID;

-- 40.  Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, 
-- UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables. HINT: Create a View

create view ProductDetails as
select p.ProductID, s.CompanyName, p.ProductName, c.CategoryName, c.Description, p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
from categories c
join products p on c.CategoryID = p.CategoryID
join suppliers s on s.supplierID = p.supplierID;

-- 41. Drop the customer details view.
drop view customerdetails;

-- 42. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
select left(CategoryName,5) as ShortInfo
from categories;

-- 43. Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create 
-- a Table, use the LIKE Statement and INSERT INTO statement. 
create table shippers_duplicate(
shippers_duplicateID int auto_increment primary key,
CompanyName varchar(50) not null,
Phone varchar(15) not null
);
insert into shippers_duplicate (CompanyName, Phone)
value('Speedy Express', '(503) 555-9831'),
	('United Package', '(503) 555-3199'),
    ('Federal Shipping', '(503) 555-9931')
;

-- 44. Create a select statement that outputs the following from the shippers_duplicate Table:
select shippers_duplicateID, CompanyName, Phone, concat(CompanyName,"@gmail.com") as Email
from shippers_duplicate;

-- **45. Create a report that shows the CompanyName and ProductName from all product in the Seafood category
select p.ProductName, c.CategoryID
from products p
join categories c on c.CategoryID = p.CategoryID
where c.CategoryID = 8;

-- **46. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
select p.ProductName, c.CategoryID
from products p
join categories c on c.CategoryID = p.CategoryID
where c.CategoryID = 5;

-- 47. Delete the shippers_duplicate table.
drop table shippers_duplicate;

-- 48. Create a select statement that ouputs the following from the employees table.
-- NB: The age might differ depending on the year you are attempting this query.
select LastName, FirstName, Title, concat(2023 - year(BirthDate)," ",'Year') as Age
from employees;

-- 49. Create a report that the CompanyName and total number of orders by customer renamed as number of orders since 
-- Decemeber 31, 1994. Show number of Orders greater than 10

select c.CompanyName, sum(od.Quantity) as 'Number Of Orders Since December 31, 1994'
from customers c
join orders o on c.CustomerID = o.CustomerID
join `order details`as od on od.OrderID = o.OrderID
where od.Quantity >= 10
group by c.CompanyName;

-- 50. Create a select statement that ouputs the following from the product table
-- NB: It should return 77rows.
select concat(ProductName,' ', 'weighs/is',' ', QuantityPerUnit,' ', 'and cost $', round(UnitPrice)) as ProductInfo
from products;