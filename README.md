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
### 1.1 Tổng quan về Products
Adventureworks kinh doanh các mặt hàng về xe đạp, phụ kiện và quần áo xe đạp. Cụ thể từ 2011-2013, doanh nghiệp có 4 Category là: Bikes - sản phẩm chủ lực, Clothing, Accessories và Component với 37 Subcategory, 606 sản phẩm thuộc 4 dòng.

### 1.2 Tỷ trọng doanh thu và lợi nhuận theo Category
<p align="center">
  <img src="https://github.com/user-attachments/assets/decc344d-0450-469f-8378-ff6a7e955afb" width="300px">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/125d1515-7e15-4399-82f2-8bba2027b398" width="300px">
</p>
Nhìn chung thì Bikes là sản phẩm mang lại doanh thu chính cũng như lợi nhuận cho doanh nghiệp, chiếm 86,2% doanh thu và 84,18% lợi nhuận. Tiếp đến là Components, đây tuy là sản phẩm chỉ được bày bán tại Reseller nhưng có đóng góp khá đáng kể so với Clothing và Accessories. Nguyên nhân bởi vì Bikes là sản phẩm chính của Adventureworks cũng như giá bán trung bình của mỗi sản phẩm ở Category Bikes là 853 USD, cao hơn hẳn so với Components là 179 USD, Clothing là 27 USD và Accessories là 23 USD như hình 2.2

### 1.3 Tình hình kinh doanh theo Category ở kênh Internet
<p align="center">
  <img src="https://github.com/user-attachments/assets/bf73de9e-c005-4d3c-896f-85848e4a7623" width="300px">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/bc9347ee-3fd4-40ca-a792-d3a369a707f6" width="300px">
</p>
 
Ở kênh Internet, Accessories tuy bán chạy nhất với 36 nghìn lượt bán nhưng doanh thu và lợi nhuận của Category này không đáng kể, chỉ chiếm tầm 2,39% doanh thu và 3,63% lợi nhuận. Doanh thu và lợi nhuận chính của kênh Internet vẫn đến từ Bikes là chính, tuy số lượng bán không nhiều bằng Accessories 15 nghìn lượt bán.

### 1.4 Tình hình kinh doanh theo Category ở kênh Reseller
<p align="center">
  <img src="https://github.com/user-attachments/assets/1a3a5f02-b699-4214-ad16-152373dc8bae" width="300px">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/c396354f-86cf-4e28-892e-4eb3d15279f6" width="300px">
</p>
 
Đối với kênh Internet thì doanh thu của Bikes vẫn chiếm phần lớn - 82,49% và có thêm sản phẩm về Components - cũng có doanh thu khá cao là 14,58%. Tuy Bikes mang lại doanh thu cao như thế nhưng về mặt lợi nhuận thì lại bị thua lỗ ở Reseller - âm 0,5 triệu USD trong vòng 3 năm như hình 2.5 trong khi Bikes ở kênh Internet vẫn đang lời với mức lợi nhuận chiếm đến 95,24% như Hình 2.4.
Nguyên nhân của tình trạng này có lẽ đến từ vấn đề chi phí dành cho Bikes ở kênh Reseller. Tất cả 4 Category thì Tổng chi phí ở Reseller đều cao hơn Internet. Những chi phí khác (chưa bao gồm chi phí sản xuất) của Bikes rất cao, hơnrất nhiều lần so với các Category còn lại.Trong 3 loại chi phí thì Thuế chiếm nhiều nhất - chiếm 70% so với tổng chi phí ở kênh Reseller, bên cạnh đó phí vận chuyển cũng khá đáng kể nhưng nhìn chung thì trung bình mỗi một sản phẩm của Bikes bán ra phải chi trả nhiều chi phí hơn so (không tính chi phí sản xuất) với sản phẩm của các Category còn lại. Những nguyên nhân trên cũng lý giải được vì sao doanh thu của Bikes rất lớn nhưng lợi nhuận lại đang bị âm ở kênh Reseller.

### 1.5 Số lượng đơn đặt hàng ở 2 kênh
<p align="center">
  <img src="https://github.com/user-attachments/assets/db8b94cf-b4b0-46a1-a0b2-ebee62fbf84e" width="300px">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/8e3ee090-6cf7-48c0-8871-cb53486de00d" width="300px">
</p>
 
Ở kênh Reseller thì Bikes được bán nhiều nhất với 75 nghìn đơn đặt hàng như hình 2.5. Bởi vì đây là sản phẩm chủ lực của Adventureworks cũng như có thể vì đối với những sản phẩm có giá bán cao thì khách hàng sẽ có xu hướng đến trực tiếp tại cửa hàng để có thể lựa chọn kỹ lưỡng hơn về chất lượng cũng như mẫu mã thay vì đặt hàng qua Internet thì chỉ được xem hình ảnh thôi. Một nguyên nhân ảnh hưởng đến việc Bikes được mua nhiều tại kênh Reseller nữa là vì ở hình 2.6 ta có thấy nếu mua Bikes ở Reseller, ta sẽ được mua với giá ưu đãi hơn rất nhiều là 882 USD thay vì phải mất 1.862 USD khi mua trên Internet. Ở kênh Internet thì Accessories bán chạy nhất với 36 nghìn đơn hàng, hơn gấp đôi Bikes với 15 nghìn đơn hàng và cuối cùng là Clothing.

Ở Hình 2.6 ta có thể thấy giá ở 2 kênh bán hàng của các Category, ở kênh Internet thì chỉ có giá bán của Accessories là thấp hơn so với kênh Reseller - 19,4 USD so với 21.67 USD. Tất cả các mặt hàng còn lại đều có giá cao hơn ở kênh Internet, đặc biệt là Bikes với mức chênh lệch lên đến 1 nghìn USD. Điều này có thể lý giải vì sao Accessories lại là Category được bán chạy nhất ở kênh Internet trong khi Bikes mới chính là sản phẩm chính của doanh nghiệp, cũng như việc Clothing và Bikes được mua với số lượng nhiều hơn ở Reseller.

Đối với Clothing thì khách hàng sẽ có xu hướng muốn đến lựa chọn trực tiếp tại cửa hàng để tránh tình trạng không mua nhầm size sản phẩm không phù hợp với bản thân. Đây cũng có thể là một nguyên nhân dẫn đến Clothing được mua tại cửa hàng trực tiếp nhiều hơn bên cạnh nguyên nhân là giá ở cửa hàng sẽ thấp hơn.



