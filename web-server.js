var express = require('express');
var parser = require('body-parser');
var zmq = require('zeromq')

var conf = require('./settings');
var logger = require('./logger');

var sock = zmq.socket('push');

var app = express();

app.use(parser.json());

app.post('/pipeline-events', function (req, res) {
  try {
    var payload = req.body;

    var status = payload.object_attributes.status;

    var user = payload.user.username;
    var project = payload.project.name;
    var branch = payload.object_attributes.ref;

    logger.info(`${status}: @${user} ${project}/${branch}`);

    if (status === 'failed') {
      sock.send(`${status}:${user}:${project}:${branch}`);
    }
  } catch (exc) {
    logger.error(exc);
  }

  res.send();
});

app.listen(conf.WEB_SERVER_PORT, conf.WEB_SERVER_HOST, function () {
    sock.bindSync(`tcp://${conf.ZMQ_SOCKET_HOST}:${conf.ZMQ_SOCKET_PORT}`);

    logger.info(
      `Listening on ${conf.WEB_SERVER_HOST}:${conf.WEB_SERVER_PORT}`
    );
});
