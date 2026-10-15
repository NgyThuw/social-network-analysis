

# Analysis - Phân tích mạng lưới
## Mục tiêu
Phân tích cấu trúc mạng lưới quan hệ xã hội và xây dựng phương pháp đề xuất kết nối bạn bè dựa trên dữ liệu đồ thị.

## Công việc
1. Thống nhất cách lấy dữ liệu từ Memgraph hoặc sử dụng dữ liệu đầu vào đã được xử lý.
2. Thống kê số người dùng và số kết nối.
3. Tính số lượng kết nối của từng người dùng (degree).
4. Xác định những người dùng có nhiều kết nối.
5. Xây dựng thuật toán đề xuất bạn bè dựa trên bạn chung.
6. Kiểm thử thuật toán trên các trường hợp mẫu.
7. Tổng hợp kết quả, bảng thống kê và hình ảnh minh họa.

## Phương pháp đề xuất bạn bè
Với một người dùng A:
1. Xác định những người đã kết nối với A.
2. Tìm những người chưa kết nối trực tiếp với A.
3. Đếm số bạn chung giữa A và từng ứng viên.
4. Xếp hạng ứng viên theo số lượng bạn chung giảm dần.
5. Trả về một số lượng ứng viên phù hợp để hiển thị trên giao diện.

## Kết quả cần trình bày
- Thống kê tổng quan mạng lưới.
- Danh sách người dùng có nhiều kết nối.
- Bảng ứng viên được đề xuất.
- Số lượng bạn chung của từng ứng viên.
- Ví dụ minh họa và nhận xét về kết quả.

## Sản phẩm bàn giao
- Mã nguồn phân tích bằng Python hoặc Cypher.
- Hàm hoặc module đề xuất bạn bè.
- Kết quả thực nghiệm.
- Giải thích phương pháp và giới hạn của thuật toán.
- Kết quả chạy thử các truy vấn phân tích trên dữ liệu thực tế.
- Bảng kết quả và ảnh chụp minh chứng.
- Kiểm thử thuật toán đề xuất với một số người dùng mẫu.
- Đánh giá kết quả và giới hạn của phương pháp.

## Lưu ý
Số lượng bạn chung chỉ là tiêu chí đề xuất cơ bản, không chứng minh mức độ thân thiết hoặc khả năng hai người sẽ kết bạn ngoài đời thực.
