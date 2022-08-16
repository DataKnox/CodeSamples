SELECT  dates.CalendarYear,
        dates.CalendarQuarter,
        custs.BirthDate,
        SUM(sales.SalesAmount) AS TotalSales
FROM dbo.FactInternetSales AS sales
JOIN dbo.DimDate AS dates ON sales.OrderDateKey = dates.DateKey
JOIN dbo.DimCustomer AS custs ON sales.CustomerKey = custs.CustomerKey
GROUP BY dates.CalendarYear, dates.CalendarQuarter, custs.BirthDate
ORDER BY dates.CalendarYear, dates.CalendarQuarter, custs.BirthDate;