#!/bin/bash
echo "开始执行更新仓库代码"
cd /elecV2P/script/Shell/scripts
git reset --hard
git -C /elecV2P/script/Shell/scripts pull --rebase
wget -P /elecV2P/script/Shell/scripts -q https://raw.githubusercontent.com/ZCY01/daily_scripts/main/jd/jd_try.js
if [[ ${ENABLE_HANGUP} == true ]]; then
    jdpid=$(ps -ef | grep "jd_crazy" | awk '{print $1}')
    echo "joy进程pid=$jdpid"
    kill $jdpid
    echo "配置jd_crazy_joy_coin重启完成"
    node /elecV2P/script/Shell/scripts/jd_crazy_joy_coin.js >/dev/null 2>&1 &
    echo "启动jd_crazy_joy_coin挂机完成"
elif [[ ${ENABLE_HANGUP} == false ]]; then
  echo -e "没有设置变量为true  不执行joy挂机"
fi
