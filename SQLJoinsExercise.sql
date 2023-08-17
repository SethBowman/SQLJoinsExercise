/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select p.Name, c.Name
 from products as p
 inner join categories as c
 on p.CategoryID = c.CategoryID
 where c.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.Name, p.Price, r.Rating
 from products as p
 inner join reviews as r
 on p.ProductID = r.ProductID
 where r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

select e.FirstName, e.LastName, sum(s.Quantity) as "Total"
from sales as s
inner join employees as e
on s.EmployeeID = e.EmployeeID
group by e.EmployeeID
order by Total desc
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

select d.Name as "Department Name", c.Name as "Category Name" from departments as d
inner join categories as c
on d.DepartmentID = c.DepartmentID
where c.Name = "Appliances" or c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 select p.Name, sum(s.Quantity) as "Total Sales", sum(s.Quantity * s.PricePerUnit) as "Total Price" from sales as s
 inner join products as p
 on s.ProductID = p.ProductID
 where p.Name like "%Hotel%";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

select p.Name, r.Reviewer, r.Rating, r.Comment from reviews as r
inner join products as p 
on r.ProductID = p.ProductID
where p.Name like "%Visio%" and r.Rating = 1;


SELECT p.Name as Product_Name, r.Reviewer, MIN(r.Rating) as Lowest_Rating, r.Comment as Reviewer_Comment
FROM Products as p
INNER JOIN Reviews as r
ON p.ProductID = r.ProductID
WHERE p.name like "%Visio TV%";
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

select e.EmployeeID, e.FirstName, e.LastName, p.Name as "Product", s.Quantity as "Quantity Sold" from sales as s
inner join employees as e 
on s.EmployeeID = e.EmployeeID
inner join products as p
on s.ProductID = p.ProductID;

select e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity from employees as e
inner join sales as s 
on e.EmployeeID = s.EmployeeID
inner join products as p
on s.ProductID = p.ProductID
order by e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity;

select p.Name as "Product Sold", p.Price, sum(s.Quantity) as "Amount Sold", e.FirstName, e.LastName, e.EmployeeID from sales as s
inner join employees as e 
on s.EmployeeID = e.EmployeeID
inner join products as p 
on s.ProductID = p.ProductID
group by e.EmployeeID, p.ProductID;
