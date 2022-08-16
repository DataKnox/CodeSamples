SELECT  ProductSubCategoryKey,
        EnglishProductName,
        ListPrice,
        ROW_NUMBER() OVER
            (PARTITION BY ProductSubCategoryKey ORDER BY ListPrice DESC) AS RowNumber,
        RANK() OVER
            (PARTITION BY ProductSubCategoryKey ORDER BY ListPrice DESC) AS Rank,
        DENSE_RANK() OVER
            (PARTITION BY ProductSubCategoryKey ORDER BY ListPrice DESC) AS DenseRank,
        NTILE(4) OVER
            (PARTITION BY ProductSubCategoryKey ORDER BY ListPrice DESC) AS Quartile
FROM dbo.DimProduct
ORDER BY ProductSubCategoryKey;


SELECT  cat.EnglishProductSubCategoryName,
        SUM(sales.OrderQuantity) AS ItemsSold,
		RANK() OVER 
			(ORDER BY SUM(sales.OrderQuantity)) as Rank
FROM dbo.FactInternetSales AS sales
JOIN dbo.DimProduct AS prod ON sales.ProductKey = prod.ProductKey
JOIN dbo.DimProductSubCategory AS cat ON prod.ProductSubCategoryKey = cat.ProductSubCategoryKey
GROUP BY cat.EnglishProductSubCategoryName
ORDER BY SUM(sales.OrderQuantity);