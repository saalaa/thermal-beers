var winston = require('winston');

module.exports = winston;

winston.remove(winston.transports.Console);
winston.add(winston.transports.Console, {
  'timestamp': true
});
