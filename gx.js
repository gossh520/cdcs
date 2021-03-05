async function downFile () {
    const url = 'https://raw.githubusercontent.com/gossh520/cdcs/main/gx.sh'
    await $download(url, '/usr/local/app/script/Shell/gx.sh', {folder: '/usr/local/app/script/Shell', name: 'gx.sh'})
}



async function start() {
  // 下载最新代码
  await downFile();
  console.log('下载代码完毕')
  // 执行
  await $exec("chmod +x ./gx.sh && ./gx.sh", {cwd: './script/Shell/', cb(data, error){if (error) {console.error(error)} else {console.log(data)}}})
}

start()
