# 🌸 HƯỚNG DẪN CÀI ĐẶT & CHẠY TOOL TRÊN ĐIỆN THOẠI ANDROID
> *Tài liệu hướng dẫn chi tiết dành cho người dùng điện thoại Android. Cài đặt 1 lần duy nhất — Hàng ngày chỉ cần 1 thao tác mở là tool tự động cày tiền.*

---

## 📦 TRỌN BỘ CẦN CHUẨN BỊ

1. **Điện thoại Android:** Yêu cầu RAM từ **3GB trở lên** (khuyến nghị 4GB+), bộ nhớ trống khoảng **1.5GB - 2GB**.
2. **File nhận từ Admin (để trong thư mục Download của điện thoại):**
   * File `SHIBU_arm64` *(Engine giải mã ngầm)*
   * File `setup_android.sh` *(Bộ cài tự động 1 chạm)*
   * File `moneytask.user.js` *(hoặc script tương ứng trong thư mục `userscripts/`)*
   * **License Key** bản quyền được cấp từ Admin.

> 💡 **Mẹo quan trọng:** Tải các file về máy và **để nguyên trong thư mục Download** (Tải về) của điện thoại, không cần giải nén hay đổi tên file.

---

## 🚀 BƯỚC 1: CÀI ĐẶT 2 ỨNG DỤNG CẦN THIẾT

Trên điện thoại, cài đặt 2 ứng dụng sau:

| Ứng dụng | Tác dụng | Link tải trực tiếp |
| :--- | :--- | :--- |
| **1. Termux** | Môi trường chạy Engine ngầm | 👉 [Tải bản chuẩn tại F-Droid (Bấm Download APK)](https://f-droid.org/packages/com.termux/)<br>*(⚠️ **Lưu ý:** Bắt buộc tải từ F-Droid, **KHÔNG** tải từ CH Play vì bản CH Play đã cũ bị lỗi)* |
| **2. Kiwi Browser** | Trình duyệt cày nhiệm vụ | 👉 [Tải trên CH Play (Google Play Store)](https://play.google.com/store/apps/details?id=com.kiwibrowser.browser) |

---

## ⚙️ BƯỚC 2: CÀI ĐẶT TỰ ĐỘNG TRÊN TERMUX *(Chỉ làm 1 lần duy nhất)*

1. Mở ứng dụng **Termux** vừa cài lên.
2. Dán lệnh sau vào Termux rồi nhấn **Enter** trên bàn phím:
   ```bash
   termux-setup-storage
   ```
   *(Điện thoại sẽ hiện bảng hỏi quyền truy cập bộ nhớ $\rightarrow$ Bấm **Cho phép** / Allow).*

3. Tiếp tục sao chép và dán lệnh sau rồi nhấn **Enter**:
   ```bash
   bash /sdcard/Download/setup_android.sh
   ```
   *(Nếu bạn tải file qua Telegram/Zalo, hãy dùng app Quản lý File chuyển file `setup_android.sh` và `SHIBU_arm64` vào thư mục `Download` rồi chạy lệnh trên).*

4. **Ngồi chờ hệ thống tự động cài đặt:**
   * Termux sẽ tự động tải môi trường Linux và Chromium chạy ngầm (~3 - 7 phút tùy tốc độ mạng).
   * Khi màn hình hiện thông báo **🎉 CÀI ĐẶT HOÀN TẤT 100%!** là xong!

---

## 🌐 BƯỚC 3: CÀI TAMPERMONKEY VÀO KIWI BROWSER *(Chỉ làm 1 lần)*

1. Mở trình duyệt **Kiwi Browser**.
2. Truy cập vào kho tiện ích: **[chromewebstore.google.com](https://chromewebstore.google.com/)**
3. Tìm kiếm từ khóa **Tampermonkey** $\rightarrow$ Bấm **Thêm vào Chrome** (Add to Chrome).
4. Sau khi cài xong Tampermonkey:
   * Bấm vào dấu **3 chấm (⋮)** ở góc trên bên phải Kiwi Browser.
   * Kéo xuống dưới cùng, chọn **Tampermonkey** $\rightarrow$ Chọn **Cấu hình / Tiện ích con**.
   * Bấm **Tạo script mới** (biểu tượng dấu `+`).
   * Xóa sạch các dòng chữ mẫu có sẵn trong ô soạn thảo.
   * Mở file **`moneytask.user.js`** (bằng app ghi chú hoặc trình duyệt), copy toàn bộ nội dung và **Dán** vào ô soạn thảo.
   * Bấm menu **Tệp (File)** $\rightarrow$ Chọn **Lưu (Save)**.

---

## 💰 BƯỚC 4: HƯỚNG DẪN BẬT TOOL HÀNG NGÀY ĐỂ CÀY TIỀN

Mỗi ngày khi muốn cày nhiệm vụ, bạn chỉ cần làm 2 bước:

### 1️⃣ Bật Engine ngầm (Termux):
* Mở app **Termux** lên.
* Gõ đúng 4 chữ:
  ```bash
  shibu
  ```
  rồi nhấn **Enter**.
* *(Lần đầu tiên chạy: Tool sẽ hỏi **License Key** $\rightarrow$ Dán Key của bạn vào rồi bấm Enter).*
* Khi thấy dòng chữ màu xanh: `Bridge Server đang lắng nghe tại http://127.0.0.1:8080` là Tool đã sẵn sàng hoạt động!

### 2️⃣ Bật cày trên trình duyệt (Kiwi Browser):
* Mở **Kiwi Browser** $\rightarrow$ Đăng nhập vào web làm nhiệm vụ.
* Bạn sẽ thấy bảng điều khiển nổi màu hồng tím **🌸 HỖ TRỢ CỤT TAY** ở góc màn hình.
* Bấm nút **▶ BẮT ĐẦU CHẠY** $\rightarrow$ Tool sẽ tự động nhận nhiệm vụ, giải mã ngầm Octolink/Hold Captcha, đợi đủ thời gian an toàn và nộp bài liên tục!

---

## 🛡️ CÀI ĐẶT CHỐNG TẮT TOOL KHI KHÓA MÀN HÌNH *(Rất quan trọng)*

Điện thoại Android thường tự động tắt ứng dụng ngầm sau vài phút để tiết kiệm pin. Để tool cày xuyên suốt cả ngày đêm:

1. **Khóa đa nhiệm (Lock App):**
   * Vuốt mở danh sách đa nhiệm (các app đang mở gần đây).
   * Giữ ngón tay vào thẻ ứng dụng **Termux** và **Kiwi Browser** $\rightarrow$ Bấm biểu tượng **Ổ khóa 🔒** để điện thoại không tự đóng app.
2. **Tắt tiết kiệm pin:**
   * Vào **Cài đặt** máy $\rightarrow$ **Ứng dụng** $\rightarrow$ Chọn **Termux**.
   * Chọn **Pin** (hoặc Tiết kiệm pin) $\rightarrow$ Chọn **Không giới hạn** (Unrestricted / Không tối ưu hóa).
   * Làm tương tự với **Kiwi Browser**.

---

## ❓ XỬ LÝ CÁC LỖI THƯỜNG GẶP

* **Lỗi: `requires the chromium snap to be installed`**
  * *Cách sửa:* Mở Termux và dán lệnh sau rồi Enter:
    ```bash
    proot-distro login ubuntu -- bash -c "apt update && apt install -y software-properties-common && add-apt-repository -y ppa:xtradeb/apps && apt update && apt install -y chromium"
    ```
* **Lỗi: Bảng điều khiển màu tím báo "Chưa kết nối Tool Go"?**
  * *Cách sửa:* Do bạn chưa mở Termux và gõ lệnh `shibu`. Mở Termux gõ `shibu` trước, sau đó quay lại Kiwi Browser tải lại trang (F5).
* **Lỗi: Chạy lệnh `setup_android.sh` báo "No such file or directory"?**
  * *Cách sửa:* Bạn chưa cấp quyền bộ nhớ. Hãy gõ lệnh `termux-setup-storage` trước, chọn Cho phép, rồi kiểm tra xem file `setup_android.sh` đã nằm trong thư mục `Download` chưa.