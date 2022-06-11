#!/bin/bash
sleep 5
green(){ echo -e "\033[32m\033[01m$1\033[0m";}
yellow(){ echo -e "\033[33m\033[01m$1\033[0m";}

info(){
v4=$(curl -s4m3 https://ip.gs -k)
v4d=$(curl -s4m3 https://ip.gs -k | awk -F '.' '{print $2"."$3}')
}

BEndpoint(){
grep Endpoint /etc/wireguard/wgcf.conf
if [[ -n $(grep -w 162.159.192.1 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.192.1/162.159.192.2/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.192.2 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.192.2/162.159.192.3/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.192.3 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.192.3/162.159.192.4/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.192.4 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.192.4/162.159.192.5/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.192.5 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.192.5/162.159.192.6/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.192.6 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.192.6/162.159.192.7/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.192.7 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.192.7/162.159.192.8/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.192.8 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.192.8/162.159.192.9/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.192.9 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.192.9/162.159.193.10/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.193.10 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.193.10/162.159.192.1/g" /etc/wireguard/wgcf.conf
fi
if [[ -n $(grep -w 162.159.193.1 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.193.1/162.159.193.2/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.193.2 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.193.2/162.159.193.3/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.193.3 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.193.3/162.159.193.4/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.193.4 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.193.4/162.159.193.5/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.193.5 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.193.5/162.159.193.6/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.193.6 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.193.6/162.159.193.7/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.193.7 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.193.7/162.159.193.8/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.193.8 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.193.8/162.159.193.9/g" /etc/wireguard/wgcf.conf
elif [[ -n $(grep -w 162.159.193.9 /etc/wireguard/wgcf.conf) ]]; then
sed -i "s/162.159.193.9/162.159.193.1/g" /etc/wireguard/wgcf.conf
fi
systemctl restart wg-quick@wgcf
}

WGCFV4(){
while true; do
info
[[ "$v4d" = "ipd" ]] && green "恭喜！目前wgcf-ipv4的IP为($v4)，设置的IP段为ipd，下轮检测将在你设置的60秒后自动执行" && sleep 60s || (BEndpoint && yellow "遗憾！目前wgcf-ipv4的IP($v4)，设置的IP段为ipd，下轮检测将在你设置的20秒后自动执行" && sleep 20s)
done
}
green "开始刷wgcf-ipv4的IP，你设置的IP段为ipd" && WGCFV4
