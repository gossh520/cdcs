//读取cookiejd数据并创建变量
if (String($store.get('CookieJD2', 'raw')) != "undefined") JD_COOKIE1 = $store.get('CookieJD', 'raw') + "&" + $store.get('CookieJD2', 'raw');
if (String($store.get('CookieJD2', 'raw')) == "undefined") JD_COOKIE1 = $store.get('CookieJD', 'raw');
$exec('node ./scripts/jd_bookshop.js', {
  cwd: './script/Shell/',
  env: {
    JD_COOKIE: JD_COOKIE1
  },
  cb(data){
    console.log(data)
  }
})