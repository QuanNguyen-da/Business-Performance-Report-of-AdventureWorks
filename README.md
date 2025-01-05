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

### 1.1 Biến động tổng doanh thu từ 1/1/2011 - 31/12/2013
<p align="center">
  <img src="https://github.com/user-attachments/assets/c76b77c0-dede-429d-91a5-0415daea8c26" width="300px">
</p>

Doanh thu từ kênh Reseller mang về luôn cao hơn kênh Internet rất nhiều ở cả 3 năm. Doanh thu từ kênh Internet có sự giảm nhẹ vài năm 2012 nhưng nhìn chung vẫn có xu hướng tăng lên và không có sự biến động đột biến gì. Doanh thu từ kênh Reseller có tăng qua 3 năm nhưng biến động rất lớn, luôn tăng giảm thất thường với biên độ thay đổi rất lớn.

### 1.2 Biến động doanh thu theo từng quý ở 2 kênh

<p align="center">
  <img src="https://github.com/user-attachments/assets/41427db0-11dd-4605-ba5d-c9e54d48f76c" width="200px">
  <img src="https://github.com/user-attachments/assets/e56c21d1-4e73-4ddd-a084-627d18ce4203" width="200px">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/e6394883-5ca7-497b-be27-c0c300f9eef8" width="200px">
</p>
Đối với kênh Internet thì doanh thu không có sự biến động gì quá lớn qua các tháng và có xu hướng tăng nhẹ từ khi dần về cuối năm. Nhưng kênh Reseller thì doanh thu có điều đặc biệt là đều có xu hướng chung là giảm ở tháng 4, tháng 7, tháng 10 và tháng 12, tăng lên ở những tháng còn lại trong cả 3 năm. Nguyên nhân chính là vì ở những tháng này số lượng các chương trình tiếp thị thấp hơn, dẫn đến doanh thu bán hàng thấp ở tất cả các Category.
<p align="center">
  <img src="https://github.com/user-attachments/assets/8e6b8603-38ff-4d8e-8d1b-feeb7f64180e" width="200px">
</p>
Điều này cho thấy các chiến dịch tiếp thị của doanh nghiệp đang có sự ảnh hưởng lớn đến hoạt động kinh doanh, nhu cầu của khách hàng được kích thích và họ mua sắm nhiều hơn khi có những chương trình tiếp thị này. Cụ thể hơn ở đây có sự tương quan thuận giữa 2 biến số này, nếu số lượng chiến dịch tiếp thị nhiều thì sẽ dẫn đến doanh thu cao. Doanh nghiệp đang triển khai khá tốt những chiến dịch tiếp thị của họ.

