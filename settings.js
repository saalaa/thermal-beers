var env = process.env;

module.exports = {

  // Name of the printer to send commands to
  PRINTER_NAME: env.PRINTER_NAME || 'zj58',

  // HTTP API address (Webhook target)
  WEB_SERVER_HOST: env.WEB_SERVER_HOST || '0.0.0.0',
  WEB_SERVER_PORT: Number.parseInt(
    env.WEB_SERVER_PORT || 9331, 10
  ),

  // ZeroMQ socket address
  ZMQ_SOCKET_HOST: env.ZMQ_SOCKET_HOST || '127.0.0.1',
  ZMQ_SOCKET_PORT: Number.parseInt(
    env.ZMQ_SOCKET_PORT || 9332, 10
  )

};
