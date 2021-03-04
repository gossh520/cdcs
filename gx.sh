#!/bin/bash
declare -i number=$RANDOM*100/32767
echo "已设置随机延迟为 $number"
sleep $number
echo "开始执行更新仓库代码"
cd /elecV2P/script/Shell/scripts
git reset --hard
git -C /elecV2P/script/Shell/scripts pull --rebase
rm -rf /elecV2P/script/Shell/scripts/jd_try.js
wget -P /elecV2P/script/Shell/scripts -q https://raw.githubusercontent.com/ZCY01/daily_scripts/main/jd/jd_try.js
