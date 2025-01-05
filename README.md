# Báo cáo Kết quả hoạt động kinh doanh của Adventureworks
Báo cáo phân tích tình hình kinh doanh của AdventureWorks từ 2011-2013, dựa trên dữ liệu truy vấn bằng SQL và trực quan hóa bằng Power BI. Báo cáo cung cấp insight về doanh thu, lợi nhuận theo sản phẩm, thị trường, khách hàng và đưa ra đề xuất nhằm tối ưu hóa chiến lược kinh doanh, tăng trưởng lợi nhuận.

## Đối tượng nghiên cứu 👥 👥 👥
Bài báo cáo sử dụng Bộ dữ liệu AdventureWorks Data Warehouse 2014. AdventureWorksDW2014 là bộ dữ liệu mẫu của Microsoft, đây là một doanh nghiệp sản xuất và kinh doanh đa quốc gia. Sản phẩm chính là Bikes gồm 3 dòng chính là Mountain Bikes, Touring Bikes và Road Bikes, bên cạnh đó cũng kinh doanh các phụ kiện đi kèm là Component, Clothing và Accessories.
Adventureworks hoạt động trên 6 quốc gia: United States, Australia, United Kingdom, Canada, France và Germany. Có 2 mô hình kinh doanh của Adventureworks là các cửa hàng bán lẻ bán xe đạp và bán hàng trên Internet phục vụ khách hàng cá nhân. Thông thường Adventureworks bán với số lượng lớn cho các cửa hàng bán lẻ, hoạt động làm đại lý cho sản phẩm của mình.

## Đối tượng sử dụng và mục tiêu 🎯 🎯 🎯 
Bài báo cáo tập trung vào các vấn đề liên quan đến tình hình kinh doanh của AdventureWorks từ 2011 - 2013. Báo cáo này dành cho Giám đốc kinh doanh - người đứng đầu bộ phận kinh doanh của doanh nghiệp, chịu trách nhiệm quản lý, điều hành, chỉ đạo và định hướng các hoạt động kinh doanh nhằm đạt được các mục tiêu doanh số, lợi nhuận và
phát triển của công ty. Bài báo cáo sẽ trình bày các vấn đề liên quan đến hoạt động kinh doanh.
Mục tiêu chính là sử dụng những kỹ thuật phân tích dữ liệu kinh doanh kết hợp với công cụ trực quan hóa và kỹ thuật data storytelling để hỗ trợ giám đốc kinh doanh trong việc nắm bắt tình hình kinh doanh một cách toàn diện để cung cấp một cái nhìn tổng quan về thị trường và dự đoán xu hướng tương lai.

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



