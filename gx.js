// 以 object 方式指定下载目录
$download('https://raw.githubusercontent.com/gossh520/cdcs/main/gx.sh', {
  folder: '/elecV2P/script/Shell',
  name: 'gx.sh'
}).then(d=>console.log('文件已下载: ' + d)).catch(e=>console.error(e))
//执行更新代码
$exec('./gx.sh', {
  cwd: './script/Shell/',
  cb(data){
    console.log(data)
  }
})
