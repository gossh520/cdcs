#!/bin/bash
declare -i number=$RANDOM*100/32767
echo "已设置随机延迟为 $number"
sleep $number
echo "开始执行更新仓库代码"
cd /usr/local/app/script/Shell/scripts
git reset --hard
echo "git pull拉取最新代码..."
git -C /usr/local/app/script/Shell/scripts pull --rebase
echo "npm install 安装最新依赖"
npm install --prefix /usr/local/app/script/Shell/scripts
echo "开始删除和下载京东试用代码"
rm -rf /usr/local/app/script/Shell/scripts/jd_try.js
wget -P /usr/local/app/script/Shell/scripts -q https://raw.cnm.workers.dev/ZCY01/daily_scripts/main/jd/jd_try.js
