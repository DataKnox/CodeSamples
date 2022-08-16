SELECT  cat.EnglishProductSubCategoryName,
        SUM(sales.OrderQuantity) AS ItemsSold
FROM dbo.FactInternetSales AS sales
JOIN dbo.DimProduct AS prod ON sales.ProductKey = prod.ProductKey
JOIN dbo.DimProductSubCategory AS cat ON prod.ProductSubCategoryKey = cat.ProductSubCategoryKey
GROUP BY cat.EnglishProductSubCategoryName
ORDER BY cat.EnglishProductSubCategoryName;