

\# Database - Memgraph



\## Mục tiêu



Xây dựng và quản lý cơ sở dữ liệu đồ thị phục vụ việc phân tích mạng lưới quan hệ xã hội và đề xuất kết nối bạn bè.



\## Công việc



1\. Tìm hiểu Memgraph, Memgraph Lab và ngôn ngữ truy vấn Cypher.

2\. Tải và kiểm tra bộ dữ liệu Facebook Social Circles.

3\. Xác định cách biểu diễn người dùng và quan hệ bạn bè.

4\. Nhập dữ liệu vào Memgraph.

5\. Viết các truy vấn kiểm tra và khai thác dữ liệu.

6\. Kiểm tra tính đúng đắn của dữ liệu sau khi nhập.



\## Mô hình dữ liệu dự kiến



\- Node: `Person`, đại diện cho một người dùng.

\- Relationship: `FRIEND`, biểu diễn mối quan hệ bạn bè.

\- Thuộc tính node: `id`, định danh người dùng trong bộ dữ liệu.



Mô hình cơ bản:



`(:Person)-\[:FRIEND]-(:Person)`



Quan hệ được xem là hai chiều đối với bộ dữ liệu kết nối bạn bè vô hướng. Cần thống nhất cách lưu và truy vấn để tránh đếm trùng kết nối.



\## Truy vấn cần chuẩn bị



\- Đếm số người dùng.

\- Đếm số quan hệ bạn bè.

\- Tìm người dùng có nhiều kết nối.

\- Tìm các bạn chung giữa hai người dùng.

\- Tìm các cặp người dùng chưa kết nối nhưng có bạn chung.



\## Sản phẩm bàn giao



\- Hướng dẫn cài đặt và chạy Memgraph.

\- Script nhập dữ liệu.

\- File truy vấn Cypher.

\- Mô tả mô hình dữ liệu.

\- Kết quả kiểm tra dữ liệu và ảnh chụp từ Memgraph Lab.



\## Lưu ý



Không đưa mật khẩu, thông tin đăng nhập hoặc dữ liệu nhạy cảm vào GitHub. Các truy vấn đề xuất chỉ là đầu vào cho bước phân tích và tích hợp ứng dụng.



