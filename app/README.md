

\# App - Ứng dụng demo



\## Mục tiêu



Xây dựng giao diện demo cho phép người dùng xem thông tin mạng lưới xã hội và khám phá các đề xuất kết nối bạn bè.



\## Công nghệ dự kiến



\- Python và Flask cho backend.

\- HTML, CSS và JavaScript cho giao diện.

\- Memgraph làm nguồn dữ liệu.

\- Cypher để truy vấn dữ liệu đồ thị.



Công nghệ giao diện có thể thay đổi nếu nhóm thống nhất sử dụng React hoặc Streamlit.



\## Chức năng dự kiến



\### 1. Tổng quan mạng lưới



Hiển thị số người dùng, số kết nối và một số thống kê chính.



\### 2. Tìm kiếm người dùng



Cho phép nhập ID người dùng và xem các thông tin hoặc kết nối liên quan.



\### 3. Phân tích mạng lưới



Hiển thị số kết nối của người dùng hoặc danh sách những người có nhiều kết nối.



\### 4. Đề xuất bạn bè



Hiển thị danh sách ứng viên chưa kết nối trực tiếp với người dùng đang chọn.



Mỗi đề xuất có thể bao gồm:



\- ID ứng viên.

\- Số lượng bạn chung.

\- Danh sách bạn chung nếu dữ liệu và giao diện cho phép.



\### 5. Trực quan hóa



Có thể bổ sung sơ đồ các nút và cạnh để người dùng dễ hiểu quan hệ giữa các thành viên trong mạng lưới.



\## Sản phẩm bàn giao



\- Mã nguồn ứng dụng.

\- Hướng dẫn cài đặt và khởi chạy.

\- Ảnh chụp các màn hình chính.

\- Video hoặc kịch bản trình diễn.

\- Danh sách chức năng đã hoàn thành.



\## Lưu ý tích hợp



Backend cần thống nhất cách kết nối Memgraph, định dạng dữ liệu trả về và cách gọi module phân tích. Không nên sao chép riêng một bộ dữ liệu khác vào giao diện nếu không cần thiết.



