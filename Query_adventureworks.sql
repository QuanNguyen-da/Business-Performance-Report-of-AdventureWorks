select  count(*) - count( distinct customerkey)  
as N'Số khóa bị trùng của Dimcustomer' from DimCustomer
select  count(*) - count( distinct Productkey)  
as N'Số khóa bị trùng của Dimproduct' from DimProduct

select * from DimCustomer

--Thêm cột Age
Alter table dimcustomer
add Age int

--Tính tuổi hiện tại của khách hàng
update dimcustomer
set age=datediff(year, BirthDate,getdate())

--Thêm cột Profit
alter table factinternetsales
add profit decimal(18,2)

alter table factresellersales
add profit decimal(18,2)

--Tính Profit =Extended Amount - Total Product Cost
update FactInternetSales
set Profit=ExtendedAmount - TotalProductCost

update factresellersales
set Profit=ExtendedAmount - TotalProductCost

--Thêm cột Net Profit Margin
alter table FactInternetSales
add Net_Profit_Margin decimal(18,2)

alter table Factresellersales
add Net_Profit_Margin decimal(18,2)

--Tính Net Profit Margin
update FactInternetSales
set Net_Profit_Margin=profit/SalesAmount

update Factresellersales
set Net_Profit_Margin=profit/SalesAmount


SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FactresellerSales';



--Thêm cột Sales channel
alter table factinternetsales
add  SalesChannel VARCHAR(50)

alter table factresellersales
add  SalesChannel VARCHAR(50)
--Cập nhật giá trị cho cột SalesChannel
update FactInternetSales
set SalesChannel ='Internet'

update factresellersales
set SalesChannel ='Reseller'

--Lấy ra các cột chung của 2 bảng
select Column_Name , DATA_TYPE
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='factInternetsales'
intersect
select Column_Name,DATA_TYPE
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='FactResellersales'
--Tạo bảng mới để chứa dữ liệu của 2 bảng
create table summary_table
(
    CurrencyKey INT, DiscountAmount FLOAT, DueDate DATETIME, DueDateKey INT, ExtendedAmount MONEY, Freight MONEY, Net_Profit_Margin DECIMAL(18, 2),
    OrderDate DATETIME, OrderDateKey INT, OrderQuantity SMALLINT,  ProductKey INT,  ProductStandardCost MONEY, profit DECIMAL(18, 2),
    PromotionKey INT,  RevisionNumber TINYINT,  SalesAmount MONEY, SalesChannel VARCHAR(50),   SalesOrderLineNumber TINYINT,  SalesOrderNumber NVARCHAR(50),
    SalesTerritoryKey INT,  ShipDate DATETIME, ShipDateKey INT,  TaxAmt MONEY, TotalProductCost MONEY,  UnitPrice MONEY, UnitPriceDiscountPct FLOAT
);
select * from summary_table
--Thêm dữ liệu vào từ 2 bảng
-- Thêm dữ liệu từ bảng factInternetsales
INSERT INTO summary_table
(
    CurrencyKey, DiscountAmount, DueDate, DueDateKey, ExtendedAmount, Freight, Net_Profit_Margin,
    OrderDate, OrderDateKey, OrderQuantity, ProductKey, ProductStandardCost, profit,
    PromotionKey, RevisionNumber, SalesAmount, SalesChannel, SalesOrderLineNumber, SalesOrderNumber,
    SalesTerritoryKey, ShipDate, ShipDateKey, TaxAmt, TotalProductCost, UnitPrice, UnitPriceDiscountPct
)
SELECT
    CurrencyKey, DiscountAmount, DueDate, DueDateKey, ExtendedAmount, Freight, Net_Profit_Margin,
    OrderDate, OrderDateKey, OrderQuantity, ProductKey, ProductStandardCost, profit,
    PromotionKey, RevisionNumber, SalesAmount, SalesChannel, SalesOrderLineNumber, SalesOrderNumber,
    SalesTerritoryKey, ShipDate, ShipDateKey, TaxAmt, TotalProductCost, UnitPrice, UnitPriceDiscountPct
FROM factInternetsales;

-- Thêm dữ liệu từ bảng FactResellersales
INSERT INTO summary_table
(
    CurrencyKey, DiscountAmount, DueDate, DueDateKey, ExtendedAmount, Freight, Net_Profit_Margin,
    OrderDate, OrderDateKey, OrderQuantity, ProductKey, ProductStandardCost, profit,
    PromotionKey, RevisionNumber, SalesAmount, SalesChannel, SalesOrderLineNumber, SalesOrderNumber,
    SalesTerritoryKey, ShipDate, ShipDateKey, TaxAmt, TotalProductCost, UnitPrice, UnitPriceDiscountPct
)
SELECT
    CurrencyKey, DiscountAmount, DueDate, DueDateKey, ExtendedAmount, Freight, Net_Profit_Margin,
    OrderDate, OrderDateKey, OrderQuantity, ProductKey, ProductStandardCost, profit,
    PromotionKey, RevisionNumber, SalesAmount, SalesChannel, SalesOrderLineNumber, SalesOrderNumber,
    SalesTerritoryKey, ShipDate, ShipDateKey, TaxAmt, TotalProductCost, UnitPrice, UnitPriceDiscountPct
FROM FactResellersales;

--Kiểm tra xem cột salesordernumber có giá trị trùng lặp không
SELECT SalesOrderNumber, COUNT(*) AS Occurrence
FROM FactInternetSales
GROUP BY SalesOrderNumber
HAVING COUNT(*) > 1;

---MARKET ANALYTIC

select * from DimGeography
--Đếm có bao nhiêu khu vực
select count(distinct(englishcountryregionname)) as 'Sum_of_Region' from DimGeography
--Nêu ra các khu vực đó
select distinct(englishcountryregionname ) as 'Name of Region' from DimGeography

--Đếm có bao nhiêu thành phố
select count(distinct(city)) as 'Sum_of_City' from DimGeography

-- Dếm có bao nhiêu bang
select count(distinct(StateProvinceName)) as 'Sum_Of_State' from DimGeography
select * from DimGeography

--Doanh thu và lợi nhuận của từng khu vực

select englishcountryregionname as 'Region', sum(salesamount) as Sales_Amount, sum(Profit) as 'Profit'
from summary_table
join DimSalesTerritory on summary_table.SalesTerritoryKey=DimSalesTerritory.SalesTerritoryKey
join DimGeography on DimSalesTerritory.SalesTerritoryKey=DimGeography.SalesTerritoryKey
group by englishcountryregionname
order by Sales_Amount desc
select * from DimSalesTerritory
--Ở mỗi khu vực thì Top 3 city mang lại doanh thu cao nhất
With city_salesamount as
(select englishcountryregionname as 'Region',
 city                            as 'City', 
 sum(salesamount)                as 'Sales_Amount',
 row_number() over (partition by englishcountryregionname order by sum(salesamount) desc ) as 'Rank'
from summary_table 
join DimSalesTerritory on summary_table.SalesTerritoryKey=DimSalesTerritory.SalesTerritoryKey
join DimGeography on DimSalesTerritory.SalesTerritoryKey=DimGeography.SalesTerritoryKey 
group by englishcountryregionname, City)

select region, City, Sales_Amount, Rank from city_salesamount
where Rank <=3
order by Region, Rank

--Ở mỗi khu vực thì năm nào mang lại doanh thu cao nhất
select * from dimdate
With year_salesamount as
(
select calendarYear as 'Year',
englishcountryregionname as 'Region',
 sum(salesamount)    as 'Sales_Amount',
 row_number() over (partition by englishcountryregionname order by sum(salesamount) desc ) as 'Rank'
from summary_table 
join dimdate on summary_table.DueDateKey=DimDate.DateKey
join DimSalesTerritory on summary_table.SalesTerritoryKey=DimSalesTerritory.SalesTerritoryKey
join DimGeography on DimSalesTerritory.SalesTerritoryKey=DimGeography.SalesTerritoryKey 
group by englishcountryregionname, CalendarYear)

select region,Year, Sales_Amount, Rank from year_salesamount
where Rank =1
order by Region, Rank


--PRODUCT ANALYTIC
--How many Category, Subcategory, Product line and Product Type
select count(distinct (ProductCategoryKey)) as 'Sum Of Category'
from DimProductCategory

select count(distinct (ProductsubCategoryKey))  as 'Sum Of SubCategory'
from DimProductSubcategory

select count(distinct (ProductKey)) as 'Sum Of Product'
from DimProduct
select * from DimProductCategory
--Sales Amount and Profit by Category
select Englishproductcategoryname, sum(salesamount) as 'Sales Amount', sum(profit) as 'Profit'
from summary_table 
join DimProduct on summary_table.ProductKey=DimProduct.ProductKey
join DimProductSubcategory on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
join DimProductCategory on DimProductSubcategory.ProductCategoryKey=DimProductCategory.ProductCategoryKey
group by Englishproductcategoryname
order by [Sales Amount] desc

--Average UnitPrice by Category
select Englishproductcategoryname as 'Category',avg(UnitPrice) as 'AVG_Unit_Price'
from summary_table
join DimProduct on summary_table.ProductKey=DimProduct.ProductKey
join DimProductSubcategory on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
join DimProductCategory on DimProductSubcategory.ProductCategoryKey=DimProductCategory.ProductCategoryKey
group by Englishproductcategoryname

--In each Category, what is the subcategory have highest sales amount?
WITH category_salesamount AS
(
    SELECT 
        EnglishProductCategoryName AS 'Category',
        EnglishProductSubcategoryName AS 'Subcategory',
        SUM(SalesAmount) AS 'Sales_Amount',
        ROW_NUMBER() OVER (PARTITION BY EnglishProductCategoryName ORDER BY SUM(SalesAmount) DESC) AS 'Rank'
    FROM summary_table 
    JOIN DimProduct ON summary_table.ProductKey = DimProduct.ProductKey
    JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
    JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
    GROUP BY EnglishProductCategoryName, EnglishProductSubcategoryName
)
SELECT 
    Category,
    Subcategory,
    Sales_Amount
FROM category_salesamount
WHERE Rank = 1
ORDER BY Category;

--.Channel Performance Analysis

--Sum_Sales_Amount in 3 year
select Sum(salesamount) as 'Sales AMount',
Sum(TotalProductCost) as ' Cost', 
sum(Profit) as 'Net Profit'
from summary_table

-- Sales Amount of Two Channel by Year
select SalesChannel as 'Channel', 
CalendarYear as 'Year', 
sum(salesamount) as 'Sales Amount'
from summary_table 
join dimdate on summary_table.DueDateKey=DimDate.DateKey
group by CalendarYear,SalesChannel

--What are the revenue share and profit share of the two sales channels?
SELECT 
    SalesChannel AS 'Sales_Channel', 
    ROUND(SUM(SalesAmount) * 100.0 / (SELECT SUM(SalesAmount) FROM summary_table), 2) AS 'Revenue_Share_Percentage',
    ROUND(SUM(Profit) * 100.0 / (SELECT SUM(Profit) FROM summary_table), 2) AS 'Profit_Share_Percentage'
FROM 
    summary_table
GROUP BY 
    SalesChannel
ORDER BY 
    SalesChannel;
