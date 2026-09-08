# 📱 HƯỚNG DẪN CÀI ĐẶT & CHẠY TOOL SHIBU TRÊN ĐIỆN THOẠI ANDROID
> *Hệ thống tự động hóa hoàn toàn 100% trên điện thoại Android (Termux) — Tự động nhận nhiệm vụ, tự động giải mã Octolink/Hold Captcha, tự động nộp bài và nhận tiền.*

---

## 📦 1. BỘ CÀI CẦN CHUẨN BỊ

Tải các file sau về điện thoại và **để nguyên trong thư mục Tải về (Download)**:

1. **`SHIBU_arm64`**: File thực thi cốt lõi của Tool (Engine ngầm cho Android 64-bit — 99% điện thoại hiện nay dùng bản này).  
   *(Nếu bạn dùng điện thoại Android 32-bit đời cũ, hãy tải file **`SHIBU_armv7`**).*
2. **`setup_android.sh`**: Bộ cài đặt môi trường tự động 1 chạm.
3. **`yeutask_cookie.txt`** (hoặc file cấu hình cookie nền tảng bạn làm): Chứa thông tin đăng nhập tài khoản.
4. **License Key**: Mã bản quyền (lấy miễn phí tại `kiemgao.site` hoặc mua từ Admin).

> 💡 **Lưu ý:** Không cần đổi tên hay giải nén file. Chỉ cần giữ nguyên trong thư mục `Download` của máy.

---

## 🚀 2. CÀI ĐẶT ỨNG DỤNG TERMUX *(Chỉ làm 1 lần)*

1. Tải và cài đặt ứng dụng **Termux** (Khuyến nghị tải bản chuẩn từ F-Droid):
   * 👉 **Link tải APK trực tiếp:** [https://f-droid.org/packages/com.termux/](https://f-droid.org/packages/com.termux/) *(kéo xuống chọn Download APK)*
   * *(⚠️ Không tải trên Google Play Store vì bản trên CH Play đã cũ và bị giới hạn hệ thống).*

---

## ⚙️ 3. CÀI ĐẶT TỰ ĐỘNG BẰNG 1 LỆNH *(Chỉ làm 1 lần duy nhất)*

1. Mở app **Termux** vừa cài lên.
2. Cấp quyền truy cập bộ nhớ bằng lệnh:
   ```bash
   termux-setup-storage
   ```
   *(Nhấn Enter $\rightarrow$ Điện thoại hiện thông báo quyền bộ nhớ $\rightarrow$ Chọn **Cho phép / Allow**).*

3. Dán lệnh cài đặt tự động sau và nhấn **Enter**:
   ```bash
   bash /sdcard/Download/setup_android.sh
   ```
4. **Hệ thống sẽ tự động hoàn toàn:**
   * Tự động cài môi trường Linux container tối ưu cho Android.
   * Tự động cài đặt Chromium Engine chạy ngầm không tiêu tốn tài nguyên màn hình.
   * Tự động tạo lối tắt khởi động nhanh `shibu`.
   * Quá trình tải và thiết lập mất khoảng 2 - 5 phút tùy tốc độ mạng.
   * Khi màn hình báo **🎉 CÀI ĐẶT HOÀN TẤT 100%!** là xong.

---

## 💰 4. CÁCH CHẠY TOOL HÀNG NGÀY ĐỂ CÀY TIỀN

Mỗi ngày khi muốn bật tool cày, bạn chỉ cần mở Termux và gõ:

```bash
shibu
```

### Quy trình tool tự hoạt động:
1. **Nhập License Key:**
   * Lần đầu tiên chạy, tool sẽ yêu cầu nhập License Key.
   * Dán mã bản quyền của bạn (lấy tại `kiemgao.site`) rồi nhấn **Enter**.
2. **Chọn nền tảng làm việc:**
   * Tool hiển thị danh sách nền tảng (YeuTask, Minuc, KiemGao, v.v.).
   * Chọn số tương ứng rồi nhấn **Enter**.
3. **Cày nhiệm vụ tự động 100%:**
   * Tool tự đọc Cookie tài khoản để đăng nhập.
   * Tự động nhận nhiệm vụ mới khi có lượt.
   * Trình duyệt Chrome ngầm (headless) tự động mở link nhiệm vụ, giải mã vượt link, vượt Hold Captcha an toàn.
   * Tự động đợi đủ giây và gửi mã hoàn thành để nhận tiền vào số dư.
   * Bạn không cần bấm tay, không cần treo màn hình sáng.

---

## 🛡️ 5. BẬT CHẾ ĐỘ CHẠY NGẦM KHÔNG BỊ TẮT KHI TẮT MÀN HÌNH

Điện thoại Android thường tự tắt ứng dụng chạy ngầm để tiết kiệm pin. Để tool cày liên tục 24/7:

1. **Khóa ứng dụng Termux trong Đa nhiệm:**
   * Mở trình quản lý đa nhiệm (các app đang chạy gần đây).
   * Nhấn giữ biểu tượng hoặc thẻ Termux $\rightarrow$ Bấm icon **Ổ khóa 🔒** để tránh bị hệ điều hành đóng.
2. **Tắt tối ưu hóa pin cho Termux:**
   * Vào **Cài đặt điện thoại** $\rightarrow$ **Ứng dụng** $\rightarrow$ Tìm **Termux**.
   * Chọn mục **Pin** (hoặc Tiết kiệm pin) $\rightarrow$ Chọn **Không giới hạn** (Unrestricted / Không tối ưu hóa).

---

## ❓ 6. CÂU HỎI THƯỜNG GẶP (FAQ)

* **Hỏi: Tool có làm nóng máy hay tốn pin không?**
  * *Trả lời:* Không. Tool đã được tối ưu chạy ngầm hoàn toàn (Headless Mode), không render giao diện đồ họa, ngắt xử lý ảnh và âm thanh nên tiêu thụ rất ít pin và RAM.
* **Hỏi: Muốn dừng tool thì làm thế nào?**
  * *Trả lời:* Trên màn hình Termux, nhấn tổ hợp phím **Ctrl + C** (hoặc nút `Ctrl` trên thanh phím phụ của Termux rồi bấm phím `c`).
* **Hỏi: Muốn cập nhật file cookie mới?**
  * *Trả lời:* Chỉ cần dán file cookie mới vào thư mục `Download` của điện thoại, tool sẽ tự động đồng bộ khi chạy lệnh `shibu`.
