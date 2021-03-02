#!/bin/bash
echo "开始执行更新仓库代码"
cd /elecV2P/script/Shell/scripts
git reset --hard
git -C /elecV2P/script/Shell/scripts pull --rebase
wget -P /elecV2P/script/Shell/scripts -q https://raw.githubusercontent.com/ZCY01/daily_scripts/main/jd/jd_try.js
