const net = require("net")
require('dotenv').config()

const { loggers } = require('winston')
const logger = loggers.get('gms')
const genset = require("../handler/genset")
const event = require("../utils/eventHandler")

logger.info(`Socket starting ${process.env.SOCKET_PORT}`)
logger.info(`Socket LIVE ${process.env.LIVE_SERVER}`)

const server = net.createServer()

clients = {}
relate = {}

try {
    event.on("command", (data) => {
        com = JSON.stringify({
            "result": data.command,
            "datatype":1,
            "uid":"1",
            "method":"writeConfig”"
            })
    
        clients[data.hostid].write(com)
        console.log(com)
    })
    
} catch(e) {
    logger.error(e)
}

function handleClientConnect(hostid, socket) {
    if(clients[hostid]) {
    } else {
        console.log("New Client Connecteddd ========= " + socket.remotePort)
        clients[hostid] = socket
        relate[socket.remotePort] = hostid
        genset.online(hostid)
    }
}

function handleClientDisconnect(port) {
    const hostid = relate[port];
    genset.offline(hostid)
    if (hostid) {
        delete clients[hostid];
        logger.debug(`Removed client ${hostid}`);
    }
    delete relate[port];
    logger.debug(`Removed relation for port ${port}`);
}

server.on("connection", (client) => {
    logger.debug(`Socket Client at ${client.remoteAddress}:${client.remotePort}`)
    client.on("data", (chunk) => {
        try {
            const json = JSON.parse(chunk.toString())
            logger.debug(json)
            handleClientConnect(json.hostid, client)           


            switch (json.method) {
                case "login":
                    genset.login(json, client)
                    break;
                case "reqdatachange":
                    genset.reqdatachange(json, client)
                    break;
                default:
                    client.write(JSON.stringify({ "method": json.method, "message": "OK", "retcode": "000000" }))
                    break;
            }

        } catch (e) {
            logger.error(`Error // ${e}`)
        }
    })

    client.on("close", (e) => handleClientDisconnect(client.remotePort))
    client.on("end", (e) => handleClientDisconnect(client.remotePort))
    client.on("error", (e) => handleClientDisconnect(client.remotePort))
    client.on("timeout", (e) => handleClientDisconnect(client.remotePort))
})


server.listen(process.env.SOCKET_PORT, process.env.HOSTNAME, () => logger.info(`Socket Started at ${process.env.HOSTNAME}:${process.env.SOCKET_PORT}`))