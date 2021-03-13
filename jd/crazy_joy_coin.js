//读取cookiejd数据并创建变量
if (String($store.get('CookieJD2', 'raw')) == "undefined" && String($store.get('CookieJD3', 'raw')) == "undefined") JD_COOKIE1 = $store.get('CookieJD', 'raw');
if (String($store.get('CookieJD2', 'raw')) != "undefined" && String($store.get('CookieJD3', 'raw')) == "undefined") JD_COOKIE1 = $store.get('CookieJD', 'raw') + "&" + $store.get('CookieJD2', 'raw') ;
if (String($store.get('CookieJD2', 'raw')) != "undefined" && String($store.get('CookieJD3', 'raw')) != "undefined") JD_COOKIE1 = $store.get('CookieJD', 'raw') + "&" + $store.get('CookieJD2', 'raw') + "&" + $store.get('CookieJD3', 'raw');
$exec('kill $(ps -ef | grep "jd_crazy" |cut -c3-5) | node ./scripts/jd_crazy_joy_coin.js >/dev/null 2>&1 &', {
  cwd: './script/Shell/',
  env: {
    JD_COOKIE: JD_COOKIE1,
    BUY_JOY_LEVEL: 0
  },
  cb(data){
    console.log(data)
  }
})
