# Database - Memgraph

Hướng dẫn triển khai và kết quả đã kiểm thử.

## Mục tiêu

Lưu trữ mạng xã hội SNAP Facebook trong Memgraph, quản trị và trực quan hóa bằng Memgraph Lab, đồng thời cung cấp các truy vấn để phân tích kết nối và đề xuất bạn bè.

## Mô hình dữ liệu

- Node `Person`: một người dùng, có thuộc tính `id` kiểu số nguyên.
- Relationship `FRIEND`: một cạnh trong danh sách SNAP, nối hai node `Person`.
- SNAP cung cấp cạnh của đồ thị vô hướng một lần. Memgraph lưu relationship theo một hướng khi nhập; các truy vấn dùng mẫu vô hướng `(:Person)-[:FRIEND]-(:Person)` để duyệt cả hai chiều và tránh tạo cạnh ngược trùng.

## Công nghệ và phiên bản đã kiểm thử

- Memgraph Platform chạy bằng Docker; Memgraph Lab truy cập trên trình duyệt tại `http://localhost:3000`.
- Memgraph `2.14.1`, Memgraph Lab `2.11.1`.
- Bolt endpoint: `127.0.0.1:7687`.
- Cypher dùng để nhập, kiểm tra và phân tích dữ liệu.

Khởi chạy lần đầu:

```powershell
docker run -d --name memgraph-platform -p 7687:7687 -p 7444:7444 -p 3000:3000 memgraph/memgraph-platform
```

Mở `http://localhost:3000` rồi chọn **Connect now**. Lần tiếp theo có thể chạy lại container đã tạo bằng `docker start memgraph-platform`; dừng bằng `docker stop memgraph-platform`. Không xóa container nếu cần giữ database cục bộ.

## Dataset và chuẩn bị CSV

Nguồn: [SNAP Facebook Social Circles](https://snap.stanford.edu/data/ego-Facebook.html), file [facebook_combined.txt.gz](https://snap.stanford.edu/data/facebook_combined.txt.gz). Giải nén `facebook_combined.txt` vào thư mục `database/`. File nguồn là edge list, mỗi dòng gồm hai ID cách nhau bởi khoảng trắng.

Tạo hai CSV trong thư mục `database/`:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
.\database\prepare_data.ps1
```

Script kiểm tra định dạng, self-loop và cạnh trùng trước khi tạo `facebook_nodes.csv` (`id`) và `facebook_edges.csv` (`source,target`). Có thể chỉ định file nguồn hoặc thư mục đầu ra bằng `-InputPath` và `-OutputDirectory`.

## Nhập dữ liệu

### Cách khuyến nghị: chạy file Cypher có sẵn

Không cần cấu hình mapping trong màn hình Import của Memgraph Lab. Nếu `facebook_nodes.csv` và `facebook_edges.csv` đã có trong `database/`, chạy các lệnh sau từ PowerShell tại thư mục gốc:

```powershell
docker cp .\database\facebook_nodes.csv memgraph-platform:/usr/lib/memgraph/facebook_nodes.csv
docker cp .\database\facebook_edges.csv memgraph-platform:/usr/lib/memgraph/facebook_edges.csv
Get-Content -Raw .\database\import_data.cypher | docker exec -i memgraph-platform mgconsole --no_history
```

`import_data.cypher` định nghĩa sẵn cách tạo node và relationship, đồng thời dùng `MERGE` để tránh tạo bản sao khi chạy lại. Việc tạo lại CSV từ `facebook_combined.txt` bằng `prepare_data.ps1` chỉ cần khi hai CSV chưa có.

Sau khi import, xác nhận có **4.039** node và **88.234** relationship bằng các truy vấn đếm trong [queries.cypher](queries.cypher).

### Cách thay thế: cấu hình import trong Memgraph Lab

Chỉ dùng cách này nếu muốn import bằng giao diện thay vì `import_data.cypher`:

1. Chọn **Import** và **Merge with the current dataset**.
2. Tải lên hai CSV.
3. Cấu hình node: có header, label `Person`, property `id` kiểu integer; đánh dấu unique và required.
4. Cấu hình edge: có header, type `FRIEND`; start `Person.id` lấy từ `source`, end `Person.id` lấy từ `target`.
5. Chọn **Preview import**, kiểm tra cấu hình rồi **Start import**.

## Truy vấn và kết quả đã kiểm thử

Các truy vấn đã lưu tại [queries.cypher](queries.cypher). Chúng gồm đếm node/cạnh, xếp hạng degree, gợi ý theo bạn chung, xác minh ứng viên và truy vấn trả về graph để trực quan hóa.

Kết quả trên dataset đã nhập:

- `Person`: **4.039**.
- `FRIEND`: **88.234** relationship.
- User `107`: degree **1.045**.
- Gợi ý hàng đầu cho user `107`: user `513`, có **19** bạn chung.
- Kiểm tra quan hệ trực tiếp giữa `107` và `513`: **0**.

Các truy vấn trong `queries.cypher` đã chạy qua `mgconsole` trên Memgraph `2.14.1` và trả về các kết quả trên.

## Export, backup và restore

- Export kết quả truy vấn: chạy truy vấn trong Memgraph Lab, dùng **Download** ở phần kết quả và chọn CSV nếu cần bảng thống kê.
- Backup logic: dùng mục **Export** trong Memgraph Lab để xuất database thành file CypherL, hoặc chạy `DUMP DATABASE;` bằng `mgconsole --output_format=cypherl`. Lưu file backup ngoài thư mục mã nguồn.
- Restore: khởi chạy một instance Memgraph rỗng cùng phiên bản, nạp file CypherL bằng Memgraph Lab hoặc `mgconsole`, rồi chạy lại hai truy vấn đếm node và relationship ở trên.
- Kiểm thử trên Memgraph `2.14.1`: đã tạo CypherL dump, restore vào container mới và xác nhận lại **4.039 node, 88.234 relationship**. Đây là logical dump/restore; chưa kiểm thử snapshot vật lý.
