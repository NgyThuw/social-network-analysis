# SOCIAL NETWORK ANALYSIS
## Phân tích mạng lưới quan hệ xã hội và đề xuất kết nối bạn bè
### 1. Giới thiệu đề tài
Dự án xây dựng một ứng dụng demo nhằm phân tích mạng lưới quan hệ xã hội bằng cơ sở dữ liệu đồ thị Memgraph và đề xuất những người dùng có thể trở thành bạn bè dựa trên các mối quan hệ chung.
Thay vì chỉ lưu dữ liệu dưới dạng bảng, dự án biểu diễn người dùng dưới dạng các nút (nodes) và quan hệ bạn bè dưới dạng các cạnh (relationships). Qua đó, nhóm có thể khám phá cấu trúc mạng lưới, xác định người dùng có nhiều kết nối và tìm kiếm những kết nối tiềm năng.

### 2. Mục tiêu
- Tìm hiểu cơ sở dữ liệu đồ thị và Memgraph.
- Xây dựng mô hình mạng lưới quan hệ xã hội.
- Phân tích đặc điểm và cấu trúc của mạng lưới.
- Xây dựng thuật toán đề xuất bạn bè dựa trên bạn chung.
- Tích hợp các chức năng vào ứng dụng demo đơn giản.

### 3. Công nghệ sử dụng
- **Memgraph:** Lưu trữ và truy vấn dữ liệu đồ thị.
- **Memgraph Lab:** Trực quan hóa và khám phá mạng lưới.
- **Cypher:** Truy vấn các nút và mối quan hệ.
- **Python:** Xử lý dữ liệu, phân tích mạng lưới và xây dựng thuật toán đề xuất.
- **Flask và HTML/CSS/JavaScript: (có thể sử dụng ngôn ngữ khác)** Xây dựng giao diện demo nếu nhóm chọn phương án này.

### 4. Dữ liệu
Dự kiến sử dụng bộ dữ liệu Facebook Social Circles của Stanford SNAP:
https://snap.stanford.edu/data/ego-Facebook.html
Dữ liệu biểu diễn các kết nối giữa người dùng. Nhóm cần kiểm tra định dạng dữ liệu và lựa chọn phần dữ liệu phù hợp trước khi nhập vào Memgraph.

### 5. Chức năng dự kiến
1. Hiển thị tổng quan mạng lưới: số người dùng và số kết nối.
2. Phân tích các chỉ số mạng lưới như số kết nối của từng người dùng.
3. Xác định người dùng có nhiều kết nối hoặc có vai trò đáng chú ý.
4. Đề xuất bạn bè tiềm năng dựa trên số lượng bạn chung.
5. Hiển thị lý do đề xuất, ví dụ: "Có 5 bạn chung".
6. Trực quan hóa một phần mạng lưới trong Memgraph Lab hoặc giao diện demo.

### 6. Phân công công việc
- **Thành viên 1:** Tìm hiểu Memgraph, xử lý dữ liệu đầu vào, thiết kế mô hình đồ thị và xây dựng các truy vấn cơ sở dữ liệu.
- **Thành viên 2:** Phân tích mạng lưới, tính toán các chỉ số và xây dựng thuật toán đề xuất bạn bè.
- **Thành viên 3:** Thiết kế giao diện, xây dựng ứng dụng demo và tích hợp các chức năng.
Các thành viên phối hợp để thống nhất định dạng dữ liệu, đầu ra của từng module và nội dung báo cáo.

### 7. Giới hạn
Kết quả đề xuất dựa trên cấu trúc mạng lưới và các mối quan hệ chung trong dữ liệu. Đây là gợi ý kết nối tiềm năng, không khẳng định hai người thực sự phù hợp hoặc có mong muốn kết bạn.

### 8. Cấu trúc dự án
- `database/`: Mô hình dữ liệu, truy vấn và hướng dẫn nhập dữ liệu.
- `analysis/`: Phân tích mạng lưới và thuật toán đề xuất.
- `app/`: Ứng dụng demo.
- `docs/`: Tài liệu thiết kế, kết quả và báo cáo.



