#!/data/data/com.termux/files/usr/bin/bash
# shibu_up_safe.sh
# Clone HTCT, rebrand phần hiển thị sang SHIBU và push vào branch riêng "htct-rebrand".
# KHÔNG ghi đè branch main.
# KHÔNG vô hiệu hóa / xóa License Key hoặc cơ chế xác thực của dự án nguồn.

set -e

# ========== CẤU HÌNH ==========
GITHUB_USER="axyz13613-hue"
REPO_NAME="ShiBuBypass"
TARGET_BRANCH="htct-rebrand"

REPO_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
SOURCE_REPO="https://github.com/whitenew1610-max/HTCT.git"
WORKDIR="$HOME/shibu_build_workspace"
# ===============================

CYAN='\033[96m'
GREEN='\033[92m'
YELLOW='\033[93m'
RED='\033[91m'
BOLD='\033[1m'
RESET='\033[0m'

step() { echo -e "${CYAN}${BOLD}[*] $1${RESET}"; }
ok()   { echo -e "${GREEN}${BOLD}[OK] $1${RESET}"; }
warn() { echo -e "${YELLOW}${BOLD}[!] $1${RESET}"; }
err()  { echo -e "${RED}${BOLD}[-] $1${RESET}"; }

echo -e "${CYAN}${BOLD}"
echo "╔══════════════════════════════════════════════╗"
echo "║          SHIBU BYPASS - SAFE UP             ║"
echo "║          Account: axyz13613-hue             ║"
echo "║          Branch : htct-rebrand              ║"
echo "╚══════════════════════════════════════════════╝"
echo -e "${RESET}"

step "Cài/kiểm tra công cụ..."
pkg install git gh sed findutils -y >/dev/null 2>&1 || true

if ! command -v git >/dev/null 2>&1; then
    err "Không tìm thấy git."
    exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
    err "Không tìm thấy GitHub CLI (gh)."
    exit 1
fi

step "Kiểm tra đăng nhập GitHub..."
if ! gh auth status >/dev/null 2>&1; then
    warn "Bạn chưa đăng nhập GitHub CLI."
    echo
    echo "Chạy trước:"
    echo "  gh auth login"
    echo
    exit 1
fi
ok "GitHub CLI đã đăng nhập"

step "Kiểm tra repo đích..."
if ! gh repo view "${GITHUB_USER}/${REPO_NAME}" >/dev/null 2>&1; then
    err "Không tìm thấy repo ${GITHUB_USER}/${REPO_NAME}"
    echo "Hãy kiểm tra lại tên repo."
    exit 1
fi
ok "Đã tìm thấy ${GITHUB_USER}/${REPO_NAME}"

step "Chuẩn bị workspace..."
rm -rf "$WORKDIR"
mkdir -p "$WORKDIR"
cd "$WORKDIR"

step "Clone source HTCT..."
git clone "$SOURCE_REPO" source
cd source
ok "Clone xong"

step "Đổi remote sang repo ShiBuBypass..."
git remote set-url origin "$REPO_URL"

# Cấu hình commit identity
git config user.name "axyz13613-hue"
git config user.email "axyz13613-hue@users.noreply.github.com"

step "Tạo branch riêng ${TARGET_BRANCH}..."
git checkout -B "$TARGET_BRANCH"

step "Rebrand phần tên hiển thị HTCT -> SHIBU..."
find . -type f \( \
    -name "*.md" -o \
    -name "*.txt" -o \
    -name "*.sh" -o \
    -name "*.py" -o \
    -name "*.java" -o \
    -name "*.xml" -o \
    -name "*.properties" -o \
    -name "*.gradle" -o \
    -name "*.json" -o \
    -name "*.yml" -o \
    -name "*.yaml" \
\) -print0 | while IFS= read -r -d '' f; do
    sed -i \
        -e 's/HO TRO CUT TAY/SHIBU BYPASS/g' \
        -e 's/Hỗ Trợ Cút Tay/SHIBU BYPASS/g' \
        -e 's/HTCT/SHIBU/g' \
        -e 's/htct/shibu/g' \
        "$f" 2>/dev/null || true
done

# Đổi tên file/thư mục có HTCT trong tên
find . -depth -name "*HTCT*" -print0 | while IFS= read -r -d '' f; do
    new="$(dirname "$f")/$(basename "$f" | sed 's/HTCT/SHIBU/g')"
    if [ "$f" != "$new" ]; then
        mv "$f" "$new" 2>/dev/null || true
    fi
done

cat > SHIBU_NOTICE.md <<'EOF'
# SHIBU Bypass — HTCT Rebrand Branch

Branch này là bản rebrand phần hiển thị từ source HTCT.

- Repo đích: `axyz13613-hue/ShiBuBypass`
- Branch: `htct-rebrand`
- Thương hiệu hiển thị: `SHIBU / ShiBu Bypass`
- Không ghi đè branch `main`
- Không vô hiệu hóa License Key hoặc cơ chế xác thực của dự án nguồn
EOF

step "Commit thay đổi..."
git add .

if git diff --cached --quiet; then
    warn "Không có thay đổi mới để commit."
else
    git commit -m "SHIBU rebrand on safe branch"
    ok "Đã commit"
fi

step "Push lên branch riêng ${TARGET_BRANCH}..."
# Chỉ force-with-lease trên branch riêng; không chạm main.
if git ls-remote --exit-code --heads origin "$TARGET_BRANCH" >/dev/null 2>&1; then
    warn "Branch ${TARGET_BRANCH} đã tồn tại, cập nhật an toàn bằng --force-with-lease"
    git push -u origin "$TARGET_BRANCH" --force-with-lease
else
    git push -u origin "$TARGET_BRANCH"
fi

ok "Hoàn tất"
echo
echo "Repo:"
echo "  https://github.com/${GITHUB_USER}/${REPO_NAME}"
echo
echo "Branch:"
echo "  https://github.com/${GITHUB_USER}/${REPO_NAME}/tree/${TARGET_BRANCH}"
echo
echo -e "${GREEN}${BOLD}Branch main không bị thay đổi.${RESET}"
