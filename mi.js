// 公共变量
//执行添加3个变量   miuser(小米运动账户) mipassword(小米运动密码) xmMinStep(步数)
// 使用api接口刷小米步数
url = 'https://service-1s44vwdq-1303989666.gz.apigw.tencentcs.com/release/xiaomi?user=' + String($store.get('miuser'))+ '&password=' + String($store.get('mipassword')) + '&step=' + String($store.get('xmMinStep'))
new Promise(resolve => {
  let note = ''
  $axios(url).then(res=>{
    if (res.status !== 200) {
      $feed.ifttt('刷步数失败 - ' + res.status, '网址：' + url)
      console.log('刷步数失败', url, res.status)
      note = `刷步数失败 - ${res.status} ${url}`
    } else {
      console.log(url, '已成功刷步数')
      note = url + ' 已成功刷步数'
    }
  }).catch(e=>{
    $feed.ifttt(e.message, '无法访问网站: ' + url)
    console.log('无法访问网站', url, e.message)
    note = '无法访问网站: ' + url + e.message
  }).finally(()=>{
    resolve(note)
  })
})