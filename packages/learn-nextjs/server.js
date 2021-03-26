var https = require('https');
var fs = require('fs');
const { parse } = require("url");

const next = require('next')
const port = parseInt(process.env.PORT, 10) || 3000
const dev = process.env.NODE_ENV !== 'production'
const app = next({ dev, dir: __dirname })
const handle = app.getRequestHandler()


var options = {
  key: fs.readFileSync('localhost.key'),
  cert: fs.readFileSync('localhost.cert'),
  // ca: [fs.readFileSync('root.crt')]
};

app.prepare().then(() => {
  https.createServer(options, (req, res) => {
    const parsedUrl = parse(req.url, true);
    return handle(req, res, parsedUrl);
    // handle ....
  }).listen(port, err => {
    if (err) throw err
    console.log(`> Ready on localhost:${port}`)
  })
})
