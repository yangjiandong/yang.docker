const { Wechaty } = require('wechaty')
// const QrcodeTerminal = require('qrcode-terminal')

Wechaty.instance() // Singleton
  .on('scan', (qrcode, status) => {
    console.log(`Scan QrCode to login: ${status}\n${qrcode}`)
    // if (!(/201|200/).test(String(status))) {
    //   const loginUrl = qrcode.replace(/\/qrcode\//, '/l/')
    //   QrcodeTerminal.generate(loginUrl)
    // }
  })
  .on('login', user => console.log(`User ${user} logined`))
  .on('message', message => console.log(`Message: ${message}`))
  .start()
