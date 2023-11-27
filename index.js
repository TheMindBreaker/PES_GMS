require('dotenv').config()
const { format, loggers, transports, Logger } = require('winston')

loggers.add('gms', {
    transports: [
      new transports.Console()
    ],
    format: format.json(),
    level: 'debug'
  })

require("./socket")
require("./API")
