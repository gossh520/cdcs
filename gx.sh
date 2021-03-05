#!/bin/bash
declare -i number=$RANDOM*100/32767
echo "已设置随机延迟为 $number"
sleep $number
echo "开始执行更新仓库代码"
cd /usr/local/app/script/Shell/scripts
git reset --hard
git -C /usr/local/app/script/Shell/scripts pull --rebase
rm -rf /usr/local/app/script/Shell/scripts/jd_try.js
wget -P /usr/local/app/script/Shell/scripts -q https://raw.githubusercontent.com/ZCY01/daily_scripts/main/jd/jd_try.js
