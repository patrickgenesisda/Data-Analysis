--SELECT TOP (1000) [OrderID]
--      ,[OrderDate]
--      ,[CustomerID]
--      ,[OrderTotal]
--  FROM [KCC].[dbo].[Orders]

Select OrderID,
OrderDate,
OrderTotal,
CustomerName,
Phone
From dbo.Orders
Join dbo.Customers on dbo.Orders.CustomerID = dbo.Customers.CustomerID