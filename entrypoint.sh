#!/bin/sh
#curl -LO https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
#unzip v2ray-linux-64.zip
#rm -rf ./v2ray-linux-64.zip
#rm -rf ./systemd
#rm -rf ./config.json
#rm -rf ./v2ctl
#rm -rf ./geosite.dat
#rm -rf ./vpoint_socks_vmess.json
#rm -rf ./vpoint_vmess_freedom.json
curl -LO https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip Xray-linux-64.zip
rm -rf ./LICENSE
rm -rf ./README.md
chmod +x ./xray
cat << EOF > config.json
{
  "inbounds": [
  {
    "port": 8080,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "ad806487-2d26-4636-98b6-ab85cc8521f7",
          "alterId": 4       
        }
      ]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
      "path": "/ws"
      }     
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
#./v2ray
./xray
