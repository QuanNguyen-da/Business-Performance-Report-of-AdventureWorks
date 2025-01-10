# Báo cáo Kết quả hoạt động kinh doanh của Adventureworks
Đối với bất kỳ doanh nghiệp nào, dữ liệu luôn mang lại giá trị to lớn. Hãy cùng phân tích bộ dữ liệu mẫu **AdventureWorks** của Microsoft để khám phá những thông tin quan trọng hỗ trợ cho các nhà ra quyết định. Sử dụng các kỹ thuật cần thiết như **Microsoft SQL Server** để truy vấn và làm sạch dữ liệu, và **Power BI** và **Tableau** để trực quan hóa nhằm hiểu rõ hơn về xu hướng cũng như những thông tin quan trọng.

## Đối tượng nghiên cứu 👥 👥 👥
Bài báo cáo sử dụng Bộ dữ liệu AdventureWorks Data Warehouse 2014. AdventureWorksDW2014 là bộ dữ liệu mẫu của Microsoft, đây là một doanh nghiệp sản xuất và kinh doanh đa quốc gia. Sản phẩm chính là Bikes gồm 3 dòng chính là Mountain Bikes, Touring Bikes và Road Bikes, bên cạnh đó cũng kinh doanh các phụ kiện đi kèm là Component, Clothing và Accessories.
Adventureworks hoạt động trên 6 quốc gia: United States, Australia, United Kingdom, Canada, France và Germany. Có 2 mô hình kinh doanh của Adventureworks là các cửa hàng bán lẻ bán xe đạp và bán hàng trên Internet phục vụ khách hàng cá nhân. Thông thường Adventureworks bán với số lượng lớn cho các cửa hàng bán lẻ, hoạt động làm đại lý cho sản phẩm của mình.

## Đối tượng sử dụng và mục tiêu 🎯 🎯 🎯 
Bài báo cáo tập trung vào các vấn đề liên quan đến tình hình kinh doanh của AdventureWorks từ 2011 - 2013. Báo cáo này dành cho Giám đốc kinh doanh - người đứng đầu bộ phận kinh doanh của doanh nghiệp, chịu trách nhiệm quản lý, điều hành, chỉ đạo và định hướng các hoạt động kinh doanh nhằm đạt được các mục tiêu doanh số, lợi nhuận và phát triển của công ty. Bài báo cáo sẽ trình bày các vấn đề liên quan đến hoạt động kinh doanh.
Mục tiêu chính là sử dụng những kỹ thuật phân tích dữ liệu kinh doanh kết hợp với công cụ trực quan hóa và kỹ thuật data storytelling để hỗ trợ giám đốc kinh doanh trong việc nắm bắt tình hình kinh doanh một cách toàn diện để cung cấp một cái nhìn tổng quan về thị trường và dự đoán xu hướng tương lai.

## Mô tả ngắn gọn về Công ty AdventureWorks
- **Lĩnh vực kinh doanh**: AdventureWorks chuyên cung cấp xe đạp và các phụ kiện cho khách hàng trên toàn thế giới.  
- **Kênh bán hàng**:  
  - Internet     : Khách hàng có thể mua sản phẩm thông qua trang web của công ty.  
  - Đại lý bán lẻ: Công ty cũng có các cửa hàng bán lẻ tại nhiều khu vực khác nhau để phục vụ khách hàng trực tiếp.

## Mô tả dữ liệu 📝
Bởi vì đây là báo cáo tình hình kinh doanh nên sử dụng các bảng liên quan như sau:
 ● Fact Reseller Sales
 ● Fact Internet Sales
 ● Dim Date
 ● Dim GeoGraphy
 ● DimProduct
 ● Dim ProductCategory
 ● Dim Product SubCategory
 ● Dim Customer
 ● Dim Sales Territory
 ● Dim Reseller
 
Ngoài ra còn có thêm các bảng được tổng hợp và tính toán thông qua Microsoft SQL Server như Legend, Profitable_Category và Geography để phục vụ cho việc phân tích. Ngoài ra còn các bảng phục vụ cho việc dự đoán như Bikessales_RSL và Final. Mặc dù có thể xử lý trên Python nhưng việc này xử lý trên Microsoft SQL Server dễ dàng hơn.

## Sử dụng SQL để Chuẩn bị và Làm sạch dữ liệu
- Mục tiêu chính là **Báo cáo Hiệu quả Kinh doanh**, vì vậy chúng ta chỉ cần một số bảng liên quan, không cần tất cả. Các bảng cần thiết đã được trình bày ở trên. Chúng ta sẽ loại bỏ các bảng khác.  
- Sau đó, bạn sẽ có các bảng sau đây: 
    <p align="center">
   <img src="https://prod-files-secure.s3.us-west-2.amazonaws.com/f1a9e588-67bc-4cd4-915f-90d3008a274a/78e687d4-e08a-448b-a4f5-8223bdc6362b/image.png" alt="image" width="450">
  </p>
  
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/f1a9e588-67bc-4cd4-915f-90d3008a274a/78e687d4-e08a-448b-a4f5-8223bdc6362b/image.png)
    
- Make sure the data is successfully imported by viewing the data in the tables.
    
    ```sql
    select * from DimCustomer
    select * from Dimdate
    select * from DimSalesTerritory
    select * from FactInternetSales
    select * from FactResellerSales
    #Do the same for the remaining tables.
    ```
    
- 3. Cleaning Data
    - Cheking for missing values/null
        
        I checked in Excel by using filters and then removing missing values or nulls.
        
    - Remove some columns that are not necessary and null
        
        ```sql
        alter table dimcustomer
        drop column suffix
        select * from dimcustomer
        
        select * from dimdate
        alter table dimdate
        drop column spanishmonthname
        
        select * from DimGeography
        alter table dimgeography
        drop column frenchcountryregionname
        # Do the same for the remaining tables.
        ```
        
    - Check for duplicate rows in the primary key columns.
        
        ```sql
        select  count(*) - count( distinct customerkey)  
        as N'Số khóa bị trùng của Dimcustomer' from DimCustomer
        
        select  count(*) - count( distinct Productkey)  
        as N'Số khóa bị trùng của Dimproduct' from DimProduct
        # Do the same for the remaining tables.
        ```
        
    - There are no duplicate rows.
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/f1a9e588-67bc-4cd4-915f-90d3008a274a/f0609795-b401-410e-9564-ecec503d69da/image.png)
        
- 4. Feature Engineering
    - **Age**: Age is essential information for analysis but is not readily available. It is calculated using the `DATEDIFF` function to determine the difference between the customer's year of birth and the current year. This value represents the customer's age.
        
        ```sql
        Alter table dimcustomer
        add Age int
        
        update dimcustomer
        set age=datediff(year, BirthDate,getdate())
        
        ```
        
    - **Profit**: This is the net profit for the business after deducting all expenses. This column is calculated by subtracting the Total Product Cost from the Extended Amount.
        
        ```sql
        --Add Column Profit
        alter table factinternetsales
        add profit decimal(18,2)
        
        alter table factresellersales
        add profit decimal(18,2)
        
        --Caculate Profit
        update FactInternetSales
        set Profit=ExtendedAmount - TotalProductCost
        
        update factresellersales
        set Profit=ExtendedAmount - TotalProductCost
        ```
        
    
    - **Net Profit Margin:** This is the net profit margin, which evaluates the profitability of the business. It is calculated by dividing Profit by Sales Amount.
        
        ```sql
        
        --Add Column Net Profit Margin
        alter table FactInternetSales
        add Net_Profit_Margin decimal(18,2)
        
        alter table Factresellersales
        add Net_Profit_Margin decimal(18,2)
        
        --Update value of Net Profit Margin
        update FactInternetSales
        set Net_Profit_Margin=profit/SalesAmount
        
        update Factresellersales
        set Net_Profit_Margin=profit/SalesAmount
        ```
        
    
    - Because the design of the AdventureWorks database contains sales data for the two channels, Internet and Reseller, in two separate tables, in order to explore the overall business metrics of the company, these two tables need to be merged. However, to distinguish between the data from the Internet and Reseller sales channels, an additional column, **Sales_Channel**, is required.
        
        ```sql
        --Add Column SalesChannel
        alter table factinternetsales
        add  SalesChannel VARCHAR(50)
        
        alter table factresellersales
        add  SalesChannel VARCHAR(50)
        
        --Updating values for SalesChannel
        update FactInternetSales
        set SalesChannel ='Internet'
        
        update factresellersales
        set SalesChannel ='Reseller'
        
        ```
        
        ```sql
        --"Retrieve the common columns of the two tables."
        select Column_Name , DATA_TYPE
        from INFORMATION_SCHEMA.COLUMNS
        where TABLE_NAME='factInternetsales'
        intersect
        select Column_Name,DATA_TYPE
        from INFORMATION_SCHEMA.COLUMNS
        where TABLE_NAME='FactResellersales'
        
        --Create a new table to merge 
        create table summary_table
        (
            CurrencyKey INT, DiscountAmount FLOAT, DueDate DATETIME, DueDateKey INT, ExtendedAmount MONEY, Freight MONEY, Net_Profit_Margin DECIMAL(18, 2),
            OrderDate DATETIME, OrderDateKey INT, OrderQuantity SMALLINT,  ProductKey INT,  ProductStandardCost MONEY, profit DECIMAL(18, 2),
            PromotionKey INT,  RevisionNumber TINYINT,  SalesAmount MONEY, SalesChannel VARCHAR(50),   SalesOrderLineNumber TINYINT,  SalesOrderNumber NVARCHAR(50),
            SalesTerritoryKey INT,  ShipDate DATETIME, ShipDateKey INT,  TaxAmt MONEY, TotalProductCost MONEY,  UnitPrice MONEY, UnitPriceDiscountPct FLOAT
        );
        
        --Add data from FactInternetsales and FactResellersales
        insert into summary_table
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
        ```
        
    - Then set the relationship between Summary_table and other tables.
- **Exploratory Data Analysis - EDA and Descriptive Statistics**
    - **1. Market Analytic**
        - *Question 1: How many Region, City and State? What are they?*
            
            ```sql
            --Region
            select count(distinct(englishcountryregionname)) as 'Sum_of_Region' from DimGeography
            select distinct(englishcountryregionname ) as 'Name of Region' from DimGeography
            
            --State
            select count(distinct(StateProvinceName)) as 'Sum_Of_State' from DimGeography
            
            --City
            select count(distinct(city)) as 'Sum_of_City' from DimGeography
            ```
            
            ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/f1a9e588-67bc-4cd4-915f-90d3008a274a/f564f74f-3253-4f96-82f0-974921b5d041/image.png)
            
            ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/f1a9e588-67bc-4cd4-915f-90d3008a274a/198e6efe-6216-4422-b4d7-435c866a9c99/image.png)
            
            ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/f1a9e588-67bc-4cd4-915f-90d3008a274a/7d59b487-7e1d-4ee3-ab9c-30b153205bf5/image.png)
            
            The AdventureWorks company operates, sells products, and currently has a presence, distributing its products across 6 regions: Australia, Canada, France, Germany, United Kingdom, and the United States. Specifically, across 71 states and 500 countries worldwide. 
            
        - *Question 2: Sales and Profit by Region?*
            
            ```sql
            --Sales Amount and Profit by region, sorted by revenue in descending order.
            select englishcountryregionname as 'Region',
             sum(salesamount) as Sales_Amount,
              sum(Profit) as 'Profit'
            from summary_table
            join DimSalesTerritory 
            on summary_table.SalesTerritoryKey=DimSalesTerritory.SalesTerritoryKey
            join DimGeography 
            on DimSalesTerritory.SalesTerritoryKey=DimGeography.SalesTerritoryKey
            group by englishcountryregionname
            order by Sales_Amount desc
            
            ```
            
        - *Question 3: What are the top 3 cities with the highest sales Sales_Amount in each region?*
            
            ```sql
            With city_salesamount as
            (
            select englishcountryregionname  as 'Region',
             city                            as 'City', 
             sum(salesamount)                as 'Sales_Amount',
             row_number() over (partition by englishcountryregionname 
             order by sum(salesamount) desc ) as 'Rank'
            from summary_table 
            join DimSalesTerritory 
            on summary_table.SalesTerritoryKey=DimSalesTerritory.SalesTerritoryKey
            join DimGeography 
            on DimSalesTerritory.SalesTerritoryKey=DimGeography.SalesTerritoryKey 
            group by englishcountryregionname, City
            )
            
            select region, City, Sales_Amount, Rank from city_salesamount
            where Rank <=3
            order by Region, Rank
            ```
            
        - Question 4: *What are the top 3 Year with the highest sales Sales_Amount in each region?*
            
            ```sql
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
            ```
            
    - **2.Product Analytic**
        - *Question 1:How many Category, Subcategory, Product line and Product Type?*
            
            ```sql
            select count(distinct (ProductCategoryKey)) as 'Sum Of Category'
            from DimProductCategory
            
            select count(distinct (ProductsubCategoryKey))  as 'Sum Of SubCategory'
            from DimProductSubcategory
            
            select count(distinct (ProductKey)) as 'Sum Of Product'
            from DimProduct
            ```
            
        - *Question 2: What is the average Unit Price by Category?*
            
            ```sql
            --Average UnitPrice by Category
            select Englishproductcategoryname as 'Category',
            avg(UnitPrice) as 'AVG_Unit_Price'
            from summary_table
            join DimProduct on summary_table.ProductKey=DimProduct.ProductKey
            join DimProductSubcategory 
            on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
            join DimProductCategory 
            on DimProductSubcategory.ProductCategoryKey=DimProductCategory.ProductCategoryKey
            group by Englishproductcategoryname
            ```
            
        - *Question3: Sales Amount and Profit by Category in descending order?*
            
            ```sql
            --Sales Amount and Profit by Category in descending order
            select Englishproductcategoryname, sum(salesamount) as 'Sales Amount', sum(profit) as 'Profit'
            from summary_table 
            join DimProduct on summary_table.ProductKey=DimProduct.ProductKey
            join DimProductSubcategory on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
            join DimProductCategory on DimProductSubcategory.ProductCategoryKey=DimProductCategory.ProductCategoryKey
            group by Englishproductcategoryname
            order by [Sales Amount] desc
            ```
            
        - *Question 4: In each Category, what is the Subcategory have highest sales amount?*
            
            ```sql
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
            
            ```
            
    - **3.Channel Performance Analysis**
        - *Question 1: Sum of Sales Amount, Cost and Net Profit ?*
            
            ```sql
            select Sum(salesamount) as 'Sales AMount',
            Sum(TotalProductCost) as ' Cost', 
            sum(Profit) as 'Net Profit'
            from summary_tabl
            ```
            
        - *Question 2:  Sales Amount of Two Channel by Year ?*
            
            ```sql
            select SalesChannel as 'Channel', 
            CalendarYear as 'Year', 
            sum(salesamount) as 'Sales Amount'
            from summary_table 
            join dimdate on summary_table.DueDateKey=DimDate.DateKey
            group by CalendarYear,SalesChannel
            ```
            
        - *Question 3: What are the revenue share and profit share of the two sales channels?*
            
            ```sql
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
            
            ```
 ## Cấu trúc nội dung bài báo cáo 
 1. Overview
 2. Sales Product Analytics
 3. Sales Market Analytics
 4. Sales Customer Analytics
 5. Recommendations

## 1. Overview

<p align="center">
  <img src="https://github.com/user-attachments/assets/5b08dc42-c189-40ab-9ee3-fc59c01c4188" width="300px">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/ca9d1e24-54c9-46d9-8738-34a55730fad0" width="300px">
</p>
 

### 1.1 Biến động tổng doanh thu từ 1/1/2011 - 31/12/2013
<p align="center">
  <img src="https://github.com/user-attachments/assets/c76b77c0-dede-429d-91a5-0415daea8c26" width="300px">
</p>

Doanh thu từ kênh Reseller mang về luôn cao hơn kênh Internet rất nhiều ở cả 3 năm. Doanh thu từ kênh Internet có sự giảm nhẹ vài năm 2012 nhưng nhìn chung vẫn có xu hướng tăng lên và không có sự biến động đột biến gì. Doanh thu từ kênh Reseller có tăng qua 3 năm nhưng biến động rất lớn, luôn tăng giảm thất thường với biên độ thay đổi rất lớn.

### 1.2 Biến động doanh thu theo từng quý ở 2 kênh

<p align="center">
  <img src="https://github.com/user-attachments/assets/41427db0-11dd-4605-ba5d-c9e54d48f76c" width="250px">
  <img src="https://github.com/user-attachments/assets/e56c21d1-4e73-4ddd-a084-627d18ce4203" width="250px">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/e6394883-5ca7-497b-be27-c0c300f9eef8" width="300px">
</p>

Đối với kênh Internet thì doanh thu không có sự biến động gì quá lớn qua các tháng và có xu hướng tăng nhẹ từ khi dần về cuối năm. Nhưng kênh Reseller thì doanh thu có điều đặc biệt là đều có xu hướng chung là giảm ở tháng 4, tháng 7, tháng 10 và tháng 12, tăng lên ở những tháng còn lại trong cả 3 năm. Nguyên nhân chính là vì ở những tháng này số lượng các chương trình tiếp thị thấp hơn, dẫn đến doanh thu bán hàng thấp ở tất cả các Category.

<p align="center">
  <img src="https://github.com/user-attachments/assets/8e6b8603-38ff-4d8e-8d1b-feeb7f64180e" width="300px">
</p>

Điều này cho thấy các chiến dịch tiếp thị của doanh nghiệp đang có sự ảnh hưởng lớn đến hoạt động kinh doanh, nhu cầu của khách hàng được kích thích và họ mua sắm nhiều hơn khi có những chương trình tiếp thị này. Cụ thể hơn ở đây có sự tương quan thuận giữa 2 biến số này, nếu số lượng chiến dịch tiếp thị nhiều thì sẽ dẫn đến doanh thu cao. Doanh nghiệp đang triển khai khá tốt những chiến dịch tiếp thị của họ.

### 1.3 Tỷ lệ doanh thu và lợi nhuận của 2 kênh

<p align="center">
  <img src="https://github.com/user-attachments/assets/83170c2c-a467-4aa1-916e-dd8bc1a920f1" width="30px">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/718535a0-edb3-4848-a8aa-2e19dd45fa23" width="300px">
</p>

Nhìn vào hai biểu đồ về doanh thu và chi phí của 2 kênh bán hàng ở Hình 1.6, ta có thể thấy Kênh Reseller mang lại doanh thu chính cho cửa hàng, chiếm gần 73.81% doanh thu trong 3 năm, gần 3⁄4 doanh thu, còn Internet chỉ mang lại 26,19% doanh thu. Điều này có thể bởi vì doanh thu chính của cửa hàng đến từ Category là Bikes, đây là mặt hàng chủ lực cũng như giá thành nó sẽ cao hơn so với các Category còn lại với đơn giá trung bình một sản phẩm của Bikes là 883 USD, còn Component là 251 USD và Clothing, Accessories lần lượt là 28 USD và 23 USD như hình 1.7.

Bên cạnh đó đối với mặt hàng Bikes thì khách hàng đa số có xu hướng mua trực tiếp tại cửa hàng hơn để dễ dàng lựa chọn mẫu mã và chất lượng. Chính vì thế mà doanh thu chủ yếu đến từ Reseller Tuy nhiên, điều doanh nghiệp thực sự quan tâm ở đây là lợi nhuận. Một vấn đề đã được nhận thấy ở đây là tuy Reseller có tỷ lệ doanh thu rất lớn nhưng lợi nhuận đem về lại không nhiều như thế, chỉ chiếm 1,79%. Kênh Internet tuy không mang lại nhiều doanh thu nhưng mức lợi nhuận lại rất lớn - 92,21% lợi nhuận như Hình 1.6.

<p align="center">
  <img src="https://github.com/user-attachments/assets/c6decf6e-ba64-486e-925c-7337b41300c7" width="300px">
</p>

Nguyên nhân có lẽ vì các nhà bán lẻ tốn quá nhiều chi phí cho một sản phẩm bán ra, nhiều hơn hẳn so với kênh Internet như Hình 1.8. Chi phí trên là chi phí trung bình cho một sản phẩm bán ra ở hai kênh, bao gồm thuế, phí vận chuyển và chiết khấu thương mại, không bao gồm chi phí sản xuất trực tiếp bởi vì chi phí sản xuất trực tiếp của sản phẩm nào cũng giống nhau, không bị ảnh hưởng bởi kênh bán hàng. Cụ thể như sau:
- Đối với một sản phẩm được bán ra, chi phí trung bình ở kênh Reseller cao hơn so với kênh Internet gần gấp 3 lần ( 51,04 USD so với 147,48
USD).
- Đầu tiên là do chi phí cho khoản chiết khấu thương mại. Đối với Reseller, doanh nghiệp có các chính sách giá cả và chiết khấu nhằm kích thích doanh số bán hàng, Internet không tốn chi phí cho khoản này như hình
1.8.
- Chi phí vận chuyển ở kênh Reseller cũng cao hơn so với Internet, đặc biệt là đối với Thuế. Thuế ở Reseller cao hơn hẳn - 39 USD so với 106 USD.
- Ngoài ra việc quản lý độ lớn của đơn đặt hàng từ reseller có thể tạo ra các khó khăn về quản lý tồn kho, sản xuất, và dịch vụ khách hàng. Nếu không được quản lý hiệu quả, điều này có thể dẫn đến các chi phí không mong muốn và làm giảm lợi nhuận. Chi phí hàng tồn kho là một chi phí rất quan trọng cần được kiểm soát chặt chẽ và thường xuyên. Đây cũng có thể là một trong những nguyên nhân dẫn đến việc lợi nhuận ở kênh Reseller bị giảm trừ đáng kể.
  
<p align="center">
  <img src="https://github.com/user-attachments/assets/026e14aa-2bdc-411a-b430-85333af9bd5c" width="300px">
</p>

Trong khi đó ở kênh Internet luôn có lời qua các năm và tăng trưởng mạnh mẽ vào năm 2013 với 16 triệu USD, hơn 10 triệu USD so với 2012 như Hình 1.10. Và đối với Reseller thì đúng là Adventureworks đang tốn rất nhiều chi phí so với doanh thu (bao gồm tất cả chi phí bao gồm chi phí sản xuất, chiết khấu, thuế, vận chuyển). Đây là một dấu hiệu đáng báo động. Doanh nghiệp nên xem xét lại khâu sản xuất cũng như các chi phí liên quan đến nhà bán lẻ như chiết khấu, thuế, vận chuyển. Đặc biệt phải có chính sách điều chỉnh lập tức để tránh tình trạng tổng chi phí lại cao hơn so với doanh thu như thế này.

### 1.4 Lợi nhuận và Biên lợi nhuận ròng ở 2 kênh

<p align="center">
  <img src="https://github.com/user-attachments/assets/c7c98276-6013-4b14-8d95-7aabc11840fe" width="300px">
</p>

Tuy là kênh mang đến phần lớn doanh thu cho cửa hàng những về mặt lợi nhuận của kênh Reseller thì không khả quan lắm. Cụ thể là biên lợi nhuận luôn thấp và bị âm ở Quý 4 năm 2011 và Quý 1 năm 2013. Doanh nghiệp cần phải khắc phục được những nguyên nhân đã được nêu ra ở trên.

<p align="center">
  <img src="https://github.com/user-attachments/assets/6ead2972-ec1d-46f6-acb9-a0a3cd511a91" width="250px">
  <img src="https://github.com/user-attachments/assets/0d650716-859b-4031-8a63-9ccbb2f6411f" width="250px">
</p>


- Đối với kênh Internet: Lợi nhuận luôn dương qua các năm, biên lợi nhuận ròng cũng dương nhưng trong 2 năm 2011 - 2012 thì chưa có sự tăng trưởng nào cho đến năm 2013 mới tăng lên hơn 10%, từ 41% ở cuối năm 2012 lên 54% ở cuối 2013 ở Hình 1.12.
- Nguyên nhân của sự tăng trưởng về biên lợi nhuận ròng ở năm 2013 này là trong 2 năm 2011 - 2012 thì chỉ bán một Category là Bikes và đến 2013 thì mới có thêm Accessories và Clothing ở Hình 1.13. Tuy năm 2013 Bikes cũng tăng trưởng về mặt doanh thu, nhiều hơn so với 2 năm trước nhưng ta có thể thấy được rằng hai Category là Accessories và Clothing mới là nguyên nhân chính làm biên lợi nhuận ròng của doanh nghiệp tăng. Điều đặc biệt ở đây là doanh thu của 2 Category này rất nhỏ so với Bikes nhưng tiềm năng sinh lợi của nó lại rất lớn, lớn hơn Bikes rất nhiều. Doanh nghiệp nên tập trung phát triển nhiều hơn vào những Category này để có được mức sinh lời nhiều hơn.

## 2.Products Analytics
### 2.1 Tổng quan về Products

<p align="center">
  <img src="https://github.com/user-attachments/assets/1b3ffecf-6852-4679-9559-62cabb721397" width="300px">
</p>
 
Adventureworks kinh doanh các mặt hàng về xe đạp, phụ kiện và quần áo xe đạp. Cụ thể từ 2011-2013, doanh nghiệp có 4 Category là: Bikes - sản phẩm chủ lực, Clothing, Accessories và Component với 37 Subcategory, 606 sản phẩm thuộc 4 dòng.

### 2.2 Tỷ trọng doanh thu và lợi nhuận theo Category

<p align="center">
  <img src="https://github.com/user-attachments/assets/decc344d-0450-469f-8378-ff6a7e955afb" width="300px">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/125d1515-7e15-4399-82f2-8bba2027b398" width="300px">
</p>

Nhìn chung thì Bikes là sản phẩm mang lại doanh thu chính cũng như lợi nhuận cho doanh nghiệp, chiếm 86,2% doanh thu và 84,18% lợi nhuận. Tiếp đến là Components, đây tuy là sản phẩm chỉ được bày bán tại Reseller nhưng có đóng góp khá đáng kể so với Clothing và Accessories. Nguyên nhân bởi vì Bikes là sản phẩm chính của Adventureworks cũng như giá bán trung bình của mỗi sản phẩm ở Category Bikes là 853 USD, cao hơn hẳn so với Components là 179 USD, Clothing là 27 USD và Accessories là 23 USD như hình 2.2

### 2.3 Tình hình kinh doanh theo Category ở kênh Internet

<p align="center">
  <img src="https://github.com/user-attachments/assets/bf73de9e-c005-4d3c-896f-85848e4a7623" width="300px">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/bc9347ee-3fd4-40ca-a792-d3a369a707f6" width="300px">
</p>
 
Ở kênh Internet, Accessories tuy bán chạy nhất với 36 nghìn lượt bán nhưng doanh thu và lợi nhuận của Category này không đáng kể, chỉ chiếm tầm 2,39% doanh thu và 3,63% lợi nhuận. Doanh thu và lợi nhuận chính của kênh Internet vẫn đến từ Bikes là chính, tuy số lượng bán không nhiều bằng Accessories 15 nghìn lượt bán.

### 2.4 Tình hình kinh doanh theo Category ở kênh Reseller

<p align="center">
  <img src="https://github.com/user-attachments/assets/1a3a5f02-b699-4214-ad16-152373dc8bae" width="300px">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/c396354f-86cf-4e28-892e-4eb3d15279f6" width="300px">
</p>
 
Đối với kênh Internet thì doanh thu của Bikes vẫn chiếm phần lớn - 82,49% và có thêm sản phẩm về Components - cũng có doanh thu khá cao là 14,58%. Tuy Bikes mang lại doanh thu cao như thế nhưng về mặt lợi nhuận thì lại bị thua lỗ ở Reseller - âm 0,5 triệu USD trong vòng 3 năm như hình 2.5 trong khi Bikes ở kênh Internet vẫn đang lời với mức lợi nhuận chiếm đến 95,24% như Hình 2.4.
Nguyên nhân của tình trạng này có lẽ đến từ vấn đề chi phí dành cho Bikes ở kênh Reseller. Tất cả 4 Category thì Tổng chi phí ở Reseller đều cao hơn Internet. Những chi phí khác (chưa bao gồm chi phí sản xuất) của Bikes rất cao, hơnrất nhiều lần so với các Category còn lại.Trong 3 loại chi phí thì Thuế chiếm nhiều nhất - chiếm 70% so với tổng chi phí ở kênh Reseller, bên cạnh đó phí vận chuyển cũng khá đáng kể nhưng nhìn chung thì trung bình mỗi một sản phẩm của Bikes bán ra phải chi trả nhiều chi phí hơn so (không tính chi phí sản xuất) với sản phẩm của các Category còn lại. Những nguyên nhân trên cũng lý giải được vì sao doanh thu của Bikes rất lớn nhưng lợi nhuận lại đang bị âm ở kênh Reseller.

### 2.5 Số lượng đơn đặt hàng ở 2 kênh

<p align="center">
  <img src="https://github.com/user-attachments/assets/db8b94cf-b4b0-46a1-a0b2-ebee62fbf84e" width="300px">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/8e3ee090-6cf7-48c0-8871-cb53486de00d" width="300px">
</p>
 
Ở kênh Reseller thì Bikes được bán nhiều nhất với 75 nghìn đơn đặt hàng như hình 2.5. Bởi vì đây là sản phẩm chủ lực của Adventureworks cũng như có thể vì đối với những sản phẩm có giá bán cao thì khách hàng sẽ có xu hướng đến trực tiếp tại cửa hàng để có thể lựa chọn kỹ lưỡng hơn về chất lượng cũng như mẫu mã thay vì đặt hàng qua Internet thì chỉ được xem hình ảnh thôi. Một nguyên nhân ảnh hưởng đến việc Bikes được mua nhiều tại kênh Reseller nữa là vì ở hình 2.6 ta có thấy nếu mua Bikes ở Reseller, ta sẽ được mua với giá ưu đãi hơn rất nhiều là 882 USD thay vì phải mất 1.862 USD khi mua trên Internet. Ở kênh Internet thì Accessories bán chạy nhất với 36 nghìn đơn hàng, hơn gấp đôi Bikes với 15 nghìn đơn hàng và cuối cùng là Clothing.

Ở Hình 2.6 ta có thể thấy giá ở 2 kênh bán hàng của các Category, ở kênh Internet thì chỉ có giá bán của Accessories là thấp hơn so với kênh Reseller - 19,4 USD so với 21.67 USD. Tất cả các mặt hàng còn lại đều có giá cao hơn ở kênh Internet, đặc biệt là Bikes với mức chênh lệch lên đến 1 nghìn USD. Điều này có thể lý giải vì sao Accessories lại là Category được bán chạy nhất ở kênh Internet trong khi Bikes mới chính là sản phẩm chính của doanh nghiệp, cũng như việc Clothing và Bikes được mua với số lượng nhiều hơn ở Reseller.

Đối với Clothing thì khách hàng sẽ có xu hướng muốn đến lựa chọn trực tiếp tại cửa hàng để tránh tình trạng không mua nhầm size sản phẩm không phù hợp với bản thân. Đây cũng có thể là một nguyên nhân dẫn đến Clothing được mua tại cửa hàng trực tiếp nhiều hơn bên cạnh nguyên nhân là giá ở cửa hàng sẽ thấp hơn.
### 2.6 Sự tăng trưởng doanh thu của các dòng xe đạp từ 2011-2013

<p align="center">
  <img src="https://github.com/user-attachments/assets/1db6c1c8-6379-45c1-b52c-7d31e5fcd6c0" width="300px">
</p>
 
Nhìn chung ở cả 2 kênh thì doanh thu của xe đạp có sự tăng trưởng, năm 2013 có thêm dòng sản phẩm mới là Touring Bikes - xe đạp đi du lịch đường dài. Có thể doanh nghiệp đã nhận thấy xu hướng của thị trường đối với dòng xe đạp du lịch này nên chỉ mới năm đầu tiên ra mắt, dòng xe đạp này đã mang lại doanh thu rất lớn cho doanh nghiệp - 15,7 triệu USD. Tuy mới ra mắt được 1 năm nhưng dòng xe này đem lại doanh thu khá lớn, đặc biệt ở kênh Reseller với 12 triệu USD trong năm 2013. Có vẻ đây là một dòng xe có tiềm năng phát triển, được thị trường ưa chuộng khá nhiều. Doanh nghiệp nên tập trung phát triển và mở rộng nhiều sản phẩm của dòng Touring Bikes này để đem lại doanh số cao.

Đối với kênh Reseller thì doanh thu lại tăng trưởng mạnh vào năm 2012, đặc biệt là Road Bikes, trái ngược với kênh Internet. Road Bikes phát triển mạnh mẽ, mang về lên đến 16 triệu USD doanh thu cho Adventureworks vào băm này. Doanh thu của xe đạp leo núi có xu hướng giảm vào năm 2013, doanh nghiệp nên có những chính sách kích thích nhu cầu mua dòng xe đạp này vào năm 2014 để doanh thu có sự tăng trưởng hơn.

## 3. Sales Market Analytics

<p align="center">
  <img src="https://github.com/user-attachments/assets/75497fa5-2333-4b17-aeae-e34af1752dc9" width="300px">
</p>

## 4.Sales Customer Analytics 

<p align="center">
  <img src="https://github.com/user-attachments/assets/785e198a-e015-4478-8d41-752b8b577035" width="300px">
</p>

 ## 5. Recommendations
 ### 5.1. Về sản phẩm
Accessories là Nhóm sản phẩm có tiềm năng sinh lời tốt nhất. Chính vì thế, doanh nghiệp nên nâng cao chất lượng và đa dạng hóa dòng sản phẩm Accessories của bạn để đáp ứng nhu cầu của các khách hàng trên toàn cầu. Tạo ra các sản phẩm độc đáo và hấp dẫn để thu hút sự chú ý của người tiêu dùng. Bên cạnh đó nên xây dựng hệ thống phân phối toàn cầu, hợp tác với các đối tác phân phối và nhà bán lẻ trên khắp thế giới để mở rộng mạng lưới phân phối và đưa sản phẩm của bạn đến tay người tiêu dùng trên các thị trường quốc tế.
## 5.2. Về thị trường
Có tiềm năng lớn cho doanh số bán hàng ở Australia. Để phát triển thị trường này, cần triển khai các chiến lược tiếp thị hiệu quả và sáng tạo. Đặc biệt, cần tập trung vào việc mở rộng đa dạng sản phẩm và áp dụng các ý tưởng mới vào lĩnh vực quần áo, phụ kiện, và xe đạp. Điều này là cần thiết vì khu vực này hiện đang gặp thách thức với giá trị đặt hàng và doanh số trung bình thấp nhất.
Theo Nghiên cứu, Netherlands có 27% tổng số chuyến đi và 25% số chuyến đi làm được thực hiện bằng xe đạp. Nó có 400 km làn đường dành cho xe đạp và gần 40% việc đi lại ở Amsterdam được thực hiện bằng xe đạp. Điều kỳ lạ là hầu hết người đi xe đạp đều không đội mũ bảo hiểm. Và trộm cắp xe đạp là một vấn đề lớn, với khoảng một trong năm (20%) chiếc xe đạp bị đánh cắp mỗi năm. Hiện này, AdventureWorks đã hoạt động tốt trên thị trường Châu Âu, nên thực hiện các bước cần thiết để tiếp cận sang thị trường Netherlands nhằm cải thiện đáng kể doanh thu và lợi nhuận.
### 5. 4. Về khách hàng
Nên trao các ưu đãi và phần thưởng cho những khách hàng có hiệu suất cao nhất để khuyến khích bán hàng nhiều hơn. Họ cũng có thể tiến hành các buổi nâng cao năng lực để tư vấn cho những khách hàng có hiệu suất thấp về các chiến lược hiệu quả nhằm cải thiện doanh số bán hàng.
