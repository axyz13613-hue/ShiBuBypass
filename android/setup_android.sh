#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#   HTCT TOOL - Script cai dat tu dong cho Android (Termux)
#   Chay 1 lan duy nhat de setup moi truong
# ============================================================

set -e

CYAN='\033[38;2;0;229;255m'
GREEN='\033[38;2;0;230;118m'
YELLOW='\033[38;2;255;179;0m'
RED='\033[38;2;255;23;68m'
BOLD='\033[1m'
RESET='\033[0m'

print_step() { echo -e "${CYAN}${BOLD}[*] $1${RESET}"; }
print_ok()   { echo -e "${GREEN}${BOLD}[OK] $1${RESET}"; }
print_warn() { echo -e "${YELLOW}${BOLD}[!] $1${RESET}"; }
print_err()  { echo -e "${RED}${BOLD}[-] $1${RESET}"; }

echo -e "${CYAN}${BOLD}"
echo "  ╔══════════════════════════════════════════════╗"
echo "  ║   HO TRO CUT TAY - Android Setup v1.0       ║"
echo "  ║   Script cai dat tu dong cho Termux          ║"
echo "  ╚══════════════════════════════════════════════╝"
echo -e "${RESET}"

# ── Kiem tra RAM ──────────────────────────────────────────
TOTAL_MEM_KB=$(grep MemTotal /proc/meminfo | awk '{print $2}')
TOTAL_MEM_GB=$(echo "scale=1; $TOTAL_MEM_KB/1024/1024" | bc 2>/dev/null || echo "?")
print_warn "RAM may tinh: ~${TOTAL_MEM_GB}GB"
if [ "$TOTAL_MEM_KB" -lt 2500000 ] 2>/dev/null; then
    print_err "RAM qua thap (<2.5GB)! Tool co the bi loi. Khuyen cao dung may >=4GB RAM."
    read -p "Van tiep tuc? (y/N): " confirm
    [[ "$confirm" != "y" && "$confirm" != "Y" ]] && exit 1
fi

# ── Buoc 1: Cap nhat Termux ───────────────────────────────
print_step "Buoc 1/5: Cap nhat Termux..."
pkg update -y && pkg upgrade -y
print_ok "Termux da cap nhat"

# ── Buoc 2: Cai proot-distro ─────────────────────────────
print_step "Buoc 2/5: Cai proot-distro (moi truong Linux)..."
pkg install proot-distro -y
print_ok "proot-distro da cai"

# ── Buoc 3: Cai Linux Container (Debian/Ubuntu) ─────────
DISTRO="debian"
if proot-distro list | grep -q "ubuntu"; then
    DISTRO="ubuntu"
    print_warn "Phat hien Ubuntu da cai san, su dung Ubuntu"
elif proot-distro list | grep -q "debian"; then
    DISTRO="debian"
    print_ok "Su dung Debian Linux"
else
    print_step "Buoc 3/5: Cai dat Debian ARM64 (moi truong Linux nhe & ho tro Chromium tot nhat)..."
    proot-distro install debian
    DISTRO="debian"
    print_ok "Debian da cai dat thanh cong"
fi

# ── Buoc 4: Cai Chromium va thu vien chuan (.deb khong snap) ────────
print_step "Buoc 4/5: Cai dat Chromium that (.deb khong dung snap)..."

if [ "$DISTRO" = "ubuntu" ]; then
    proot-distro login ubuntu -- bash -c "
        apt update -q
        apt install -y software-properties-common ca-certificates curl
        add-apt-repository -y ppa:xtradeb/apps 2>/dev/null || true
        apt update -q
        apt install -y chromium fonts-liberation libnss3 libasound2 libatk-bridge2.0-0 \
                       libgtk-3-0 libgbm1 libxdamage1 libxrandr2 libxcomposite1 2>/dev/null || \
        apt install -y chromium-browser fonts-liberation libnss3 ca-certificates
        echo 'Chromium:' \$(chromium --version 2>/dev/null || chromium-browser --version 2>/dev/null || echo 'OK')
    "
else
    proot-distro login debian -- bash -c "
        apt update -q
        apt install -y chromium fonts-liberation libnss3 libasound2 \
                       ca-certificates curl
        echo 'Chromium:' \$(chromium --version 2>/dev/null || echo 'OK')
    "
fi
print_ok "Chromium va cac thu vien da cai dat hoan tat"

# ── Buoc 5: Thiet lap Wake Lock va lenh tat ──────────────
print_step "Buoc 5/5: Thiet lap chong ngu ngam va lenh khoi dong nhanh..."

# Tao lenh tat nhanh run-htct trong Linux container (co tu dong tim file trong /sdcard/Download)
proot-distro login $DISTRO -- bash -c "
cat > /usr/local/bin/run-htct << 'EOF'
#!/bin/bash
mkdir -p /tmp /data/local/tmp 2>/dev/null || true
chmod 1777 /tmp 2>/dev/null || true
export TMPDIR=/tmp

# Uu tien cap nhat tu thu muc Download neu nguoi dung chep file moi vao
for p in /sdcard/Download/HTCT_arm64 /sdcard/Download/HTCT_armv7 /sdcard/HTCT_arm64 /sdcard/HTCT_armv7; do
    if [ -f "\$p" ]; then
        BIN_NAME="\$(basename "\$p")"
        if [ ! -f "/root/\$BIN_NAME" ] || [ "\$p" -nt "/root/\$BIN_NAME" ]; then
            echo "[*] Phat hien ban moi cua \$BIN_NAME tai Download, dang cap nhat..."
            cp -f "\$p" "/root/\$BIN_NAME"
        fi
        TOOL_PATH="/root/\$BIN_NAME"
        break
    fi
done

if [ -z "\$TOOL_PATH" ]; then
    TOOL_PATH="\$(find /root /home -maxdepth 2 \( -name 'HTCT_arm64' -o -name 'HTCT_armv7' \) 2>/dev/null | head -1)"
fi

if [ -z \"\$TOOL_PATH\" ]; then
    echo -e '\033[31m[-] Khong tim thay file HTCT_arm64 hoac HTCT_armv7!\033[0m'
    echo '[*] Ban hay tai file HTCT_arm64 (hoac HTCT_armv7) ve may (de trong thu muc Download) roi go lai: htct'
    exit 1
fi

chmod +x \"\$TOOL_PATH\"
echo -e '\033[32m[*] Dang khoi chay HTCT Engine...\033[0m'
\"\$TOOL_PATH\" \"\$@\"
EOF
chmod +x /usr/local/bin/run-htct
"

# Tao lenh tat nhanh 'htct' truc tiep tren man hinh Termux (khong can vao distro)
cat > "$PREFIX/bin/htct" << EOF
#!/data/data/com.termux/files/usr/bin/bash
termux-wake-lock 2>/dev/null || true
export TMPDIR=/data/data/com.termux/files/usr/tmp
mkdir -p "\$TMPDIR" 2>/dev/null || true
proot-distro login $DISTRO -- run-htct "\$@"
EOF
chmod +x "$PREFIX/bin/htct"

print_ok "Da thiet lap xong lenh khoi chay nhanh: htct"

# ── Tong ket ─────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}"
echo "  ╔══════════════════════════════════════════════════════╗"
echo "  ║  🎉 CAI DAT HOAN TAT 100%!                          ║"
echo "  ║                                                      ║"
echo "  ║  Tu bay gio, moi lan muon chay tool chi can:        ║"
echo "  ║                                                      ║"
echo "  ║     👉 Mo Termux va go duy nhat: htct                ║"
echo "  ║                                                      ║"
echo "  ║  Tool se tu dong nhan nhiem vu & cay tien 100%!     ║"
echo "  ╚══════════════════════════════════════════════════════╝"
echo -e "${RESET}"
echo ""
