var cp = require('child_process');
var zmq = require('zeromq')

var conf = require('./settings');
var logger = require('./logger');
var zj58 = require('./zj-58');

var sock = zmq.socket('pull');

sock.connect(`tcp://${conf.ZMQ_SOCKET_HOST}:${conf.ZMQ_SOCKET_PORT}`);

sock.on('message', function (msg) {
  msg = msg.toString();

  logger.info(msg);

  var [status, user, project, branch, ...rest] = msg.split(':');

  var lpr = cp.spawn('lpr', ['-P', conf.PRINTER_NAME])

  lpr.stdin.write(`
${zj58.PD_N37}
${zj58.TXT_ALIGN_CT}@${user} broke
${zj58.TXT_ALIGN_CT}${project}/${branch}
${zj58.TXT_ALIGN_LT}
               . | ,
   o88b     .\\'     '/.
  _| 9p    -  1 POINT  -
  []  [     '/,     .\\\`
   [__]        ' | \` 
${zj58.CTL_FF}
${zj58.CTL_FF}
${zj58.CTL_FF}
`);

  lpr.stdin.end();

  lpr.stderr.on('data', function (data) {
    logger.error(`lpr: ${data}`);
  });
});
