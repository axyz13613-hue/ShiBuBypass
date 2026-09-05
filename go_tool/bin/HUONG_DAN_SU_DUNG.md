# 🚀 HƯỚNG DẪN SỬ DỤNG TOOL AUTO HTCT ENGINE (CHẠY TRỰC TIẾP)
> **Phiên bản:** v7.3 Pro Edition • Hỗ trợ đa nền tảng: YeuTask, MoneyTask, Minuc  
> **Bộ phận hỗ trợ kỹ thuật & Kích hoạt bản quyền:** *(Liên hệ Admin / Shop cung cấp key)*

---

## 🎁 GIỚI THIỆU
Phần mềm **HTCT Auto Engine** là công cụ tự động hóa giải mã và vượt link nhiệm vụ tốc độ cao chạy trực tiếp trên máy tính. Tool được tích hợp đầy đủ công nghệ lõi:
- **Tự động 100%:** Tự mở trình duyệt ngầm, bỏ qua đếm ngược (countdown), giải captcha, vượt link rút gọn và tự động gửi nhận thưởng.
- **Ẩn danh & Chống phát hiện:** Tích hợp bộ giả lập thiết bị (Mobile Device Emulation) và cơ chế chống phát hiện bot.
- **Hỗ trợ Proxy đa luồng:** Hỗ trợ chạy song song nhiều luồng và tự động xoay danh sách Proxy thông minh.
- **Không phụ thuộc tiện ích:** Chạy độc lập hoàn toàn bằng file `HTCT.exe`, không cần cài đặt thêm extension hay kịch bản phức tạp.

---

## 📌 QUY TRÌNH 3 BƯỚC KHỞI ĐỘNG NHANH (QUICK START)

```mermaid
flowchart LR
    Step1["BƯỚC 1\nChạy HTCT.exe &\nNhập License Key"] --> Step2["BƯỚC 2\nChọn Nền tảng &\nNạp Cookie"] --> Step3["BƯỚC 3\nDán link nhiệm vụ &\nTool tự động giải mã 100%"]
```

---

## 🟢 BƯỚC 1: Khởi động & Nhập Bản quyền

1. Giải nén thư mục phần mềm bạn nhận được từ Shop.
2. Mở thư mục `bin/` và **nhấp đúp chuột mở file `HTCT.exe`**.
3. **Nhập License Key:**
   * Màn hình xuất hiện dòng nhắc:
     ```text
       BẢN QUYỀN  Nhập License Key (kiemgao.site): 
     ```
   * Bạn copy mã Key được cấp (hoặc lấy key miễn phí tại `https://kiemgao.site`), nhấp chuột phải vào màn hình để dán và nhấn **Enter**.
   * *(Mã Key sẽ được lưu tự động vào file `.octo_license`, từ các lần sau bạn không cần nhập lại).*

---

## 🟢 BƯỚC 2: Thiết lập Thông số & Nạp Cookie

### 1. Cấu hình Số luồng & Proxy:
* `Số luồng chạy song song (1-10) [Mặc định: 1]`:
  * Nếu dùng mạng trực tiếp (không proxy): Nhập `1` hoặc `2` rồi nhấn **Enter**.
  * Nếu dùng proxy: Có thể nhập `3` - `5` luồng để cày nhanh hơn.
* `Số nhiệm vụ đổi Proxy một lần [Mặc định: 2]`:
  * Nhấn **Enter** để dùng mặc định (cứ sau mỗi 2 nhiệm vụ tool sẽ tự đổi sang IP tiếp theo).

### 2. Thiết lập Mục tiêu số nhiệm vụ:
* Màn hình hỏi: `Bạn muốn làm bao nhiêu nhiệm vụ thì dừng?`
  * **Chạy liên tục xuyên suốt:** Nhấn **Enter** (hoặc gõ `N`).
  * **Chạy đủ số lượng rồi nghỉ:** Nhập số lượng mong muốn (ví dụ: `50`, `100`) rồi nhấn **Enter**.

### 3. Chọn Nền tảng làm việc:
* Bảng chọn nền tảng xuất hiện:
  ```text
    ─── CHỌN NỀN TẢNG NHIỆM VỤ (Platform Selection) ─────────────────────
      • [1] yt    : YeuTask      (yeutask.com)
      • [2] mnt   : MoneyTask    (moneytask.top)
      • [3] minuc : Minuc        (minuc.vn)
    ────────────────────────────────────────────────────────────────────
    >> Chọn web muốn làm (gõ: 1 / 2 / 3 hoặc yt / mnt / minuc): 
  ```
* Bạn gõ số `1` (hoặc `yt`) cho YeuTask, `2` (hoặc `mnt`) cho MoneyTask, `3` (hoặc `minuc`) cho Minuc.

### 4. Nạp Cookie đăng nhập:
* **Nếu đã có sẵn file cookie** (ví dụ `yeutask_cookie.txt`, `moneytask_cookie.txt`): Tool sẽ tự phát hiện, bạn chỉ cần nhấn **Enter** để tiếp tục.
* **Nếu là lần đầu chạy:** Dán chuỗi Cookie tài khoản của bạn vào và nhấn **Enter**. Tool sẽ tự động lưu lại cho các phiên làm việc sau.

---

## 🟢 BƯỚC 3: Dán link và Treo máy Tự động

Khi thấy Bảng điều khiển hệ thống hiển thị:
```text
  ─── BẢNG ĐIỀU KHIỂN HỆ THỐNG ─────────────────── ● ONLINE ───
    • Bản quyền : VIP-••••4T3I [Còn 30d]   • Số luồng  : 1 Worker
    • Thiết bị  : 935b1ba0••••4b7a         • Trạng thái: ● READY TO SOLVE
    • Mạng Proxy: Direct Net (Trực tiếp)   • Cổng API  : http://127.0.0.1:8080
    • Mục tiêu  : Không giới hạn           • Tiến độ   : 0 Hoàn thành
    • Nền tảng  : YeuTask (yeutask.com)    • Cookie    : Đã nạp (308 chars)
  ────────────────────────────────────────────────────────────────────

>> Dán link nhiệm vụ (hoặc gõ 'exit'): 
```

1. Bạn chỉ cần copy link nhiệm vụ (link Octolink, Uptolink, Shortlink...), click chuột phải để dán vào dòng nhắc và nhấn **Enter**.
2. **Tool sẽ tự động xử lý toàn bộ quy trình:**
   * Mở trình duyệt Chrome ngầm tương thích.
   * Vượt qua các bước đếm ngược và kiểm tra bảo mật.
   * Tự động giải Captcha và tìm mã xác nhận (Passcode/Redirect).
   * Tự động hoàn tất nhiệm vụ và nhận thưởng trực tiếp vào tài khoản web của bạn.
3. Sau khi làm xong, tool sẽ báo kết quả màu xanh lá và tiếp tục chờ bạn dán link tiếp theo.

> [!TIP]
> Bạn có thể thu nhỏ cửa sổ `HTCT.exe` xuống thanh Taskbar và thoải mái lướt web, xem phim hay làm các công việc khác trong lúc tool tự động chạy ngầm.

---

## ⚙️ CẤU HÌNH NÂNG CAO (PROXY & BLACKLIST)

### 1. Thêm danh sách Proxy xoay IP (`proxies.txt`)
Trong thư mục `bin/` có file `proxies.txt`. Mở file này bằng Notepad và dán danh sách proxy vào (mỗi dòng 1 proxy):

```text
# Hỗ trợ tất cả định dạng proxy thông dụng:
103.152.220.14:8080
103.152.220.14:8080:username:password
http://username:password@103.152.220.14:8080
socks5://username:password@103.152.220.14:1080
```
* **Chạy IP nhà:** Nếu không có proxy, chỉ cần để trống file `proxies.txt`, Tool sẽ tự động kết nối bằng mạng máy tính trực tiếp.
* **Tự động Cooldown:** Nếu một proxy bị mất kết nối hoặc chập chờn, Tool sẽ tự động cho proxy đó nghỉ tạm thời 5 phút rồi mới tái sử dụng, giúp công việc không bị gián đoạn.

### 2. Danh sách chặn nhiệm vụ lỗi (`blacklist_camps.txt`)
Nếu phát hiện mã chiến dịch nào bị lỗi từ phía nhà mạng (ví dụ web đích hỏng, hết ngân sách), bạn mở file `blacklist_camps.txt` và ghi mã đó vào (ví dụ: `199-2`). Tool sẽ tự động bỏ qua mã này ngay lập tức.

### 3. File lưu trữ cấu hình:
* `.octo_license`: Lưu License Key bản quyền đã kích hoạt.
* `.octo_settings`: Lưu số luồng và tần suất xoay proxy.
* `yeutask_cookie.txt` / `moneytask_cookie.txt` / `minuc_cookie.txt`: Lưu trữ cookie đăng nhập tương ứng của từng web.

---

## ❓ CÂU HỎI THƯỜNG GẶP (FAQ)

### 1. Làm sao để dừng Tool an toàn?
* Bấm tổ hợp phím **Ctrl + C** trên cửa sổ console hoặc gõ **`exit`** tại dòng nhắc nhập link. Tool sẽ dọn dẹp tiến trình an toàn và hiển thị bảng tổng kết hoạt động phiên (thời gian chạy, số nhiệm vụ thành công, tốc độ trung bình).

### 2. Lỗi "Cổng Bridge 8080 bị chiếm"?
* Mở **Task Manager** (Ctrl + Shift + Esc), tìm các tiến trình `HTCT.exe` cũ còn sót lại và bấm **End task**, sau đó mở lại tool.

### 3. Muốn đổi License Key hoặc đổi Cookie thì làm thế nào?
* **Đổi Key:** Xóa file `.octo_license` trong thư mục `bin/` rồi mở lại tool để nhập key mới.
* **Đổi Cookie:** Mở file cookie tương ứng (ví dụ `yeutask_cookie.txt`) dán cookie mới vào và lưu lại, hoặc mở tool lên và dán đè cookie mới khi được hỏi.

---

## 📞 HỖ TRỢ KỸ THUẬT
Nếu cần hỗ trợ kỹ thuật hoặc gia hạn key bản quyền, vui lòng liên hệ với Quản trị viên:
* 🌐 **Lấy Key / Quản lý bản quyền:** `https://kiemgao.site`
* 💬 **Kênh hỗ trợ:** *(Liên hệ trực tiếp người bán / Admin)*
* ⏰ **Hỗ trợ:** 08:00 - 23:00 hàng ngày
