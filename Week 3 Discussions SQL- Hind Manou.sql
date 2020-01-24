DROP table IF EXISTS #Orders, #Customer

-- Orders table provides sales order detail: segment, country and sales
SELECT OrderID, Segment, OrderCountry, Sales INTO #Orders FROM (VALUES
	(111222, 'Office', 'USA', 200), 
	(222333, 'Kitchen', 'USA', 120), 
	(333444, 'Kitchen', 'Canada', 180),
	(444555, 'Living Room', 'USA', 300),
	(444777, 'Living Room', 'Canada', 200)) 
	AS Orders(OrderID, Segment, OrderCountry, Sales)
SELECT * FROM #Orders

-- Custmer table provides customer detail: name and state
SELECT OrderID, Name, State INTO #Customer FROM (VALUES
	(111222, 'Hind', 'TX'), 
	(222333, 'Mouna', 'OK'), 
	(333444, 'Gil', 'AB'),
	(444666, 'Living Room', 'PA')) 
	AS Customer(OrderID, Name, State)
SELECT * FROM #Customer

-- Inner Join creates a table with rows of matching Order ID from both tables = 3 rows
SELECT * FROM #Orders O INNER JOIN #Customer C ON O.OrderID=C.OrderID

-- Left Join creates a table with all rows from Orders table = 5 rows
SELECT * FROM #Orders O LEFT JOIN #Customer C ON O.OrderID=C.OrderID

-- Right Join creates a table with all rows from Customers table = 4 rows
SELECT * FROM #Orders O Right JOIN #Customer C ON O.OrderID=C.OrderID

-- Full Join creates a table with all rows from both tables = 6 rows
SELECT * FROM #Orders O Full JOIN #Customer C ON O.OrderID=C.OrderID

