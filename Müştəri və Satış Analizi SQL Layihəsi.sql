
                           <<<<Müştəri və Satış Analizi SQL Layihəsi>>>>
                       
                       
1)SELECT*FROM orders o                      


2) Hər məhsulun kateqoriyası

SELECT p.product_name , c.category_name 
FROM products p
JOIN categories c ON p.category_id  = c.category_id ;




3) Hər sifarişin müştəri (şirkətinin) adı ilə birlikdə siyahısı

SELECT o.order_id , c.company_name , o.order_date 
FROM orders o
JOIN customers c ON o.customer_id  = c.customer_id ;



4)Hər müştərinin(şirkətinin) ümumi sifariş sayı

SELECT c.company_name , COUNT(o.order_id) AS TotalOrders
FROM customers c
LEFT JOIN orders o ON c.customer_id= o.customer_id 
GROUP BY c.company_name 
ORDER BY TotalOrders DESC;



5)Ən çox satış edən işçilər

SELECT e.first_name , e.last_name , SUM(od.quantity  * od.unit_price) AS TotalSales
FROM employees e
JOIN orders o ON e.employee_id  = o.employee_id 
JOIN order_details od ON o.order_id  = od.order_id 
GROUP BY e.first_name , e.last_name 
ORDER BY TotalSales DESC;



6)Ən çox gəlir gətirən məhsullar

SELECT p.product_name , SUM(od.Quantity * od.unit_price) AS TotalRevenue
FROM order_details od
JOIN products p ON od.product_id  = p.product_id 
GROUP BY p.product_name 
ORDER BY TotalRevenue DESC;



7)Kateqoriyalar üzrə gəlir

SELECT cat.category_name , SUM(od.quantity  * od.unit_price) AS TotalRevenue
FROM order_details od
JOIN products p ON od.product_id  = p.product_id 
JOIN categories cat ON p.category_id  = cat.category_id 
GROUP BY cat.category_name 
ORDER BY TotalRevenue DESC;






8)Hər ilin ümumi satış məbləği

SELECT 
    EXTRACT(YEAR FROM o.order_date) AS Year,
    ROUND(SUM(od.quantity * od.unit_price)::numeric, 2) as TotalSales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY Year
ORDER by Year;



9)Ay-ay satış trendləri (bütün illər üzrə)

SELECT 
    EXTRACT(MONTH FROM o.order_date) AS Month,
    ROUND(SUM(od.quantity * od.unit_price)::numeric, 2) AS TotalSales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY Month
ORDER BY Month;




10) İllər və aylar üzrə satış məbləği

SELECT 
    EXTRACT(YEAR FROM o.order_date) AS Year,
    EXTRACT(MONTH FROM o.order_date) AS Month,
    ROUND(SUM(od.quantity * od.unit_price)::numeric, 2) as MonthlySales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY Year, Month
ORDER by Year, Month;

































