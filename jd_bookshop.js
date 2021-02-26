$exec('node ./scripts/jd_bookshop.js', {
  cwd: './script/Shell/',
  env: {
    JD_COOKIE: $.getdata("CookieJD")
  },
  cb(data){
    console.log(data)
  }
})