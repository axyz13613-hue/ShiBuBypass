# 🚀 HƯỚNG DẪN SỬ DỤNG TOOL AUTO SHIBU ENGINE (DÀNH CHO KHÁCH HÀNG)
> **Phiên bản:** v7.3 Pro Edition • Hỗ trợ đa nền tảng: MoneyTask, Minuc (Kiếm Khoai), Yêu Task,...  
> **Bộ phận hỗ trợ kỹ thuật & Kích hoạt bản quyền:** *(Liên hệ Admin / Shop cung cấp key)*

---

## 🎁 LỜI CẢM ƠN & GIỚI THIỆU
Cảm ơn bạn đã tin tưởng và sử dụng phần mềm **SHIBU Auto Engine**. Tool được tích hợp công nghệ giải mã vượt link tự động siêu tốc, chống phát hiện (Anti-Detect), hỗ trợ xoay Proxy và chạy song song nhiều luồng giúp bạn tối đa hóa thu nhập hoàn toàn tự động.

Tài liệu này được thiết kế ngắn gọn, dễ hiểu nhất để bạn có thể **cài đặt và chạy kiếm tiền ngay sau 3 phút**!

---

## 📌 QUY TRÌNH 3 BƯỚC KHỞI ĐỘNG NHANH (QUICK START)

```mermaid
flowchart LR
    Step1["BƯỚC 1\nCài Tampermonkey &\nThêm Userscript"] --> Step2["BƯỚC 2\nChạy SHIBU.exe &\nNhập Key bản quyền"] --> Step3["BƯỚC 3\nVào Web nhiệm vụ &\nBấm BẬT AUTO"]
```

---

## 🟢 BƯỚC 1: Cài đặt tiện ích trên Trình duyệt

Bạn có thể sử dụng bất kỳ trình duyệt nào: **Google Chrome, Microsoft Edge, Brave, Cốc Cốc**.

1. **Cài đặt tiện ích Tampermonkey:**
   * Truy cập cửa hàng tiện ích Chrome: [Cài đặt Tampermonkey tại đây](https://chromewebstore.google.com/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
   * Bấm **Thêm vào Chrome (Add to Chrome)**.

2. **Thêm kịch bản (Userscript) vào Tampermonkey:**
   * Nhấp vào biểu tượng **Tampermonkey** ở góc trên bên phải trình duyệt -> Chọn **Tạo kịch bản mới (Create a new script)** hoặc dấu **`+`**.
   * Xóa toàn bộ nội dung mặc định trong khung soạn thảo.
   * Mở file script được gửi kèm trong thư mục `userscripts/` (mở bằng Notepad):
     * Nếu cày **MoneyTask**: mở file `moneytask.user.js`
     * Nếu cày **Kiếm Khoai / Minuc**: mở file `kiemkhoai.user.js`
     * Nếu cày **Yêu Task**: mở file `yeutask.user.js`
   * **Copy toàn bộ mã** trong file đó và **Dán** vào Tampermonkey.
   * Nhấn phím **Ctrl + S** (hoặc chọn *File -> Save*) để lưu lại.

> [!TIP]
> **Cấp quyền mạng cho Tampermonkey (Rất quan trọng):**  
> Khi vào web nhiệm vụ lần đầu, nếu Tampermonkey hiện thông báo yêu cầu kết nối tới `127.0.0.1:8080`, hãy chọn **"Always allow domain" (Luôn cho phép)** để script có thể giao tiếp với Tool Go.

---

## 🟢 BƯỚC 2: Khởi động & Cấu hình Tool `SHIBU.exe`

1. Giải nén thư mục Tool bạn nhận được từ Shop.
2. Vào thư mục `bin/` và **nhấp đúp chuột mở file `SHIBU.exe`**.

3. **Cấu hình trên màn hình đen (Console):**

   * **1. Nhập Key bản quyền:**
     * Màn hình hiện: `Vui lòng nhập License Key:`
     * Hãy copy mã Key được Shop cấp, click chuột phải vào màn hình để dán và nhấn **Enter**.
     * *(Key sẽ được lưu tự động, từ lần chạy sau bạn không cần nhập lại).*

   * **2. Thiết lập Số luồng & Proxy:**
     * `Số luồng chạy song song (1-10) [Mặc định: 1]`: 
       * Nếu dùng mạng gia đình bình thường (không proxy): Nhập `1` hoặc `2` rồi nhấn **Enter**.
       * Nếu có dàn Proxy xịn: Có thể nhập `3` - `5` luồng để cày nhanh hơn.
     * `Số nhiệm vụ đổi Proxy một lần [Mặc định: 2]`:
       * Nhấn **Enter** để dùng mặc định (cứ làm xong 2 nhiệm vụ tool sẽ tự đổi sang IP tiếp theo).

   * **3. Đặt mục tiêu số nhiệm vụ muốn làm:**
     * Màn hình hỏi: `Bạn muốn làm bao nhiêu nhiệm vụ thì dừng?`
     * **Muốn chạy liên tục không dừng:** Chỉ cần nhấn phím **Enter** (hoặc gõ `N`).
     * **Muốn chạy đủ số lượng rồi tự nghỉ:** Nhập số (ví dụ: `50` hoặc `100`) rồi nhấn **Enter**.

4. **Khi thấy thông báo màu xanh lá:**
   ```text
   [OK] Bridge Server đang lắng nghe tại http://127.0.0.1:8080
   >> SẴN SÀNG: Bridge Server đang chạy (Cổng: 8080)
   ```
   👉 **Chúc mừng! Tool đã chạy nền thành công và sẵn sàng nhận việc.**

---

## 🟢 BƯỚC 3: Bật Auto và Treo máy Kiếm tiền

1. Mở trình duyệt, truy cập và đăng nhập vào tài khoản web nhiệm vụ (VD: `https://moneytask.top/`).
2. Lúc này trên góc màn hình web sẽ xuất hiện bảng điều khiển của **Hỗ Trợ Cụt Tay / SHIBU**.
3. Bấm vào nút **BẬT AUTO (START)**.
4. **Hệ thống sẽ tự động:**
   * Tìm và nhận nhiệm vụ mới.
   * Chặn mở tab phiền phức, tự gửi link sang Tool `SHIBU.exe`.
   * Tool Go tự vượt bước, bypass xác thực và lấy mã trong vài giây.
   * Tự điền mã xác nhận và nộp bài nhận tiền!

> [!NOTE]
> Bạn có thể thu nhỏ cửa sổ `SHIBU.exe` xuống thanh Taskbar và để trình duyệt chạy nền làm việc khác thoải mái.

---

## ⚙️ HƯỚNG DẪN CẤU HÌNH NÂNG CAO (CHO DÂN CÀY NHIỀU ACC / PROXY)

### 1. Cách thêm danh sách Proxy để xoay IP (`proxies.txt`)
Trong thư mục `bin/` có file `proxies.txt`. Bạn mở file này lên và dán danh sách proxy vào (mỗi dòng 1 proxy):

```text
# Hỗ trợ tất cả các định dạng proxy phổ biến:
103.152.220.14:8080
103.152.220.14:8080:username:password
http://username:password@103.152.220.14:8080
socks5://username:password@103.152.220.14:1080
```
* **Lưu ý**: Nếu bạn không có proxy, hãy để trống file `proxies.txt`, Tool sẽ tự động dùng mạng gốc của máy tính.
* **Cơ chế Cooldown thông minh**: Nếu 1 proxy bị chập chờn hoặc mất mạng, Tool sẽ tự động cho proxy đó "nghỉ ngơi" 5 phút rồi mới sử dụng lại, không làm gián đoạn quá trình cày.

### 2. Bỏ qua các mã Camp bị lỗi (`blacklist_camps.txt`)
Nếu bạn phát hiện có link nhiệm vụ nào bị hỏng web đích hoặc lỗi, hãy mở file `blacklist_camps.txt` và điền mã camp đó vào (Ví dụ: `199-2`, `237-3`). Tool sẽ tự động bỏ qua mã này ngay lập tức mà không cần tắt tool đi bật lại.

---

## ❓ CÂU HỎI THƯỜNG GẶP & KHẮC PHỤC SỰ CỐ (FAQ)

### 1. Lỗi: "Không thể mở cổng Bridge 8080"
* **Hiện tượng**: Tool vừa mở lên báo lỗi đỏ cổng 8080 bị chiếm rồi tự tắt.
* **Cách xử lý**:
  1. Do lần trước bạn tắt chưa hết hoặc có tool khác đang mở.
  2. Bấm tổ hợp phím **Ctrl + Shift + Esc** để mở **Task Manager**.
  3. Tìm các tiến trình có tên `SHIBU.exe`, `octotool.exe` hoặc `main.exe` -> Nhấn **End Task** để tắt đi.
  4. Mở lại `SHIBU.exe`.

### 2. Lỗi: "Xác thực thất bại: license key invalid / expired"
* **Nguyên nhân**: Key nhập sai ký tự, key đã hết hạn hoặc bạn đổi sang máy tính khác.
* **Cách xử lý**: Xóa file `.octo_license` trong thư mục `bin/` rồi mở lại Tool để nhập Key mới. Nếu bạn thay đổi máy tính, hãy nhắn tin cho Admin để được hỗ trợ chuyển đổi thiết bị (Reset HWID).

### 3. Tool đã bật nhưng trên Web không tự nhận nhiệm vụ?
* **Cách xử lý**:
  1. Đảm bảo cửa sổ `SHIBU.exe` vẫn đang mở và báo `SẴN SÀNG: Bridge Server đang chạy (Cổng: 8080)`.
  2. Nhấn **F5** để tải lại trang web nhiệm vụ.
  3. Kiểm tra xem icon Tampermonkey trên trình duyệt có hiện số (đang hoạt động) hay không.

### 4. Cách tắt Tool đúng cách để không bị lỗi?
* Khi muốn dừng tool, bạn chỉ cần bấm tổ hợp phím **Ctrl + C** trên cửa sổ đen của `SHIBU.exe`. Tool sẽ dừng an toàn và hiển thị bảng thống kê tổng số nhiệm vụ bạn đã hoàn thành trong phiên chạy.

---

## 📞 THÔNG TIN HỖ TRỢ KHÁCH HÀNG
Nếu gặp bất kỳ khó khăn nào trong quá trình cài đặt và sử dụng, vui lòng liên hệ ngay với chúng tôi để được hỗ trợ qua Ultraview / AnyDesk:

* 💬 **Telegram:** `@admin_support` *(hoặc liên hệ người bán)*
* 🌐 **Kênh thông báo & Update:** `t.me/your_channel`
* ⏰ **Thời gian hỗ trợ:** 08:00 - 23:00 hàng ngày

---
*Chúc bạn có trải nghiệm tuyệt vời và kiếm được thật nhiều thu nhập cùng **SHIBU Auto Engine**!*
