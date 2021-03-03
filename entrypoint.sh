#!/bin/sh
curl -LO https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip v2ray-linux-64.zip
rm -rf ./v2ray-linux-64.zip
rm -rf ./systemd
rm -rf ./config.json
rm -rf ./v2ctl
rm -rf ./vpoint_socks_vmess.json
rm -rf ./vpoint_vmess_freedom.json
chmod +x ./v2ray
#curl -LO https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
#unzip Xray-linux-64.zip
#rm -rf ./LICENSE
#rm -rf ./README.md
#chmod +x ./xray
cat << EOF > config.json
{
    "log": {
        "loglevel": "warning"
    },
    "routing": {
        "domainStrategy": "AsIs",
        "rules": [
            {
                "type": "field",
                "inboundTag": "wsdoko",
                "outboundTag": "ssredirect"
            },
            {
                "type": "field",
                "ip": [
                    "geoip:private"
                ],
                "outboundTag": "blocked"
            }
        ]
    },
    "inbounds": [
        {
            "port": 8080,
            "protocol": "dokodemo-door",
            "tag": "wsdoko",
            "settings": {
                "address": "v1.mux.cool",
                "followRedirect": false,
                "network": "tcp, udp"
            },
            "sniffing": {
                "enabled": true,
                "destOverride": [
                    "http",
                    "tls"
                ]
            },
            "streamSettings": {
                "network": "ws",
                "wsSettings": {
                    "path": "/peng"
                }
            }
        },
        {
            "port": 9090,
            "protocol": "shadowsocks",
            "settings": {
                "method": "chacha20-ietf-poly1305",
                "password": "peng",
                "network": "tcp,udp"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom",
            "settings": {},
            "tag": "direct"
        },
        {
            "protocol": "blackhole",
            "settings": {},
            "tag": "blocked"
        },
        {
            "protocol": "freedom",
            "tag": "ssredirect",
            "settings": {
                "redirect": "127.0.0.1:9090"
            }
        }
    ]
}
EOF
./v2ray
#./xray
