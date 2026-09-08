#!/data/data/com.termux/files/usr/bin/bash
# shibu_up.sh - Tạo repo SHIBU_Bypass, clone source, rebrand phần hiển thị và push lên GitHub.
# Lưu ý: script này KHÔNG vô hiệu hóa / xóa License Key hoặc cơ chế xác thực của dự án nguồn.

set -e

GITHUB_USER="ShibuBypass"
REPO_NAME="SHIBU_Bypass"
REPO_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
SOURCE_REPO="https://github.com/whitenew1610-max/HTCT.git"
WORKDIR="$HOME/shibu_build_workspace"

CYAN='\033[96m'
GREEN='\033[92m'
YELLOW='\033[93m'
RED='\033[91m'
RESET='\033[0m'

step() { echo -e "${CYAN}[*] $1${RESET}"; }
ok()   { echo -e "${GREEN}[OK] $1${RESET}"; }
warn() { echo -e "${YELLOW}[!] $1${RESET}"; }
err()  { echo -e "${RED}[-] $1${RESET}"; }

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════╗"
echo "║          SHIBU BYPASS - GITHUB UP           ║"
echo "║          Account: ShibuBypass               ║"
echo "╚══════════════════════════════════════════════╝"
echo -e "${RESET}"

step "Kiểm tra công cụ..."
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
    echo "Chạy: gh auth login"
    exit 1
fi
ok "GitHub CLI đã đăng nhập"

step "Tạo repo ${GITHUB_USER}/${REPO_NAME}..."
if gh repo view "${GITHUB_USER}/${REPO_NAME}" >/dev/null 2>&1; then
    warn "Repo đã tồn tại, sẽ dùng repo hiện có."
else
    gh repo create "${GITHUB_USER}/${REPO_NAME}" \
        --public \
        --description "SHIBU Bypass - rebranded Android/Termux project" \
        --confirm
    ok "Đã tạo repo"
fi

step "Chuẩn bị workspace..."
rm -rf "$WORKDIR"
mkdir -p "$WORKDIR"
cd "$WORKDIR"

step "Clone source..."
git clone "$SOURCE_REPO" source
cd source
ok "Clone xong"

step "Đổi remote về repo SHIBU..."
git remote set-url origin "$REPO_URL"

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

find . -depth -name "*HTCT*" -print0 | while IFS= read -r -d '' f; do
    new="$(dirname "$f")/$(basename "$f" | sed 's/HTCT/SHIBU/g')"
    if [ "$f" != "$new" ]; then
        mv "$f" "$new" 2>/dev/null || true
    fi
done

cat > SHIBU_NOTICE.md <<'EOF'
# SHIBU Bypass

Bản rebrand được tạo bởi script `shibu_up.sh`.

- Thương hiệu hiển thị: SHIBU / ShiBu Bypass
- GitHub: ShibuBypass
- Script không vô hiệu hóa License Key hoặc cơ chế xác thực của dự án nguồn.
- Hãy kiểm tra license của dự án nguồn trước khi phân phối hoặc chỉnh sửa lại sản phẩm.
EOF

step "Commit..."
git add .

if git diff --cached --quiet; then
    warn "Không có thay đổi mới để commit."
else
    git config user.name "ShibuBypass"
    git config user.email "shibubypass@users.noreply.github.com"
    git commit -m "Initial SHIBU rebrand"
    ok "Đã commit"
fi

git branch -M main

step "Push lên GitHub..."
git push -u origin main --force
ok "Đã push"

echo
echo -e "${GREEN}Hoàn tất:${RESET}"
echo "https://github.com/${GITHUB_USER}/${REPO_NAME}"
