require('dotenv').config();
const { loggers } = require('winston')
const logger = loggers.get('gms')
const event = require("../utils/eventHandler")
const express = require('express');
const app = express();
const http = require('http');
const bodyParser = require('body-parser');
const { Server } = require("socket.io");

const app2 = express();
const serverio = http.createServer(app2);
const io = new Server(serverio, {
    cors: {
        origin: "*", // Replace with the URL of your Angular app
        methods: ["GET", "POST"],
        credentials: false
      }
});
var cors = require('cors')


io.on('connection', (socket) => {
    socket.on("command", (data) => {
        event.emit("command", {hostid: data.hostid, command:data.command})
    })

    socket.on('register', (hostid) => {
        socket.join(hostid); // Join a room named after the hostid
    });
});

event.on('gensets', (data) => {
    io.to(data.hostid).emit('update', data);
});




serverio.listen(process.env.SOCKET_PORT_WEB, () => {
    logger.info('Socket.IO server running on port 3000');
});

app.use((req, res, next) => {
    const start = Date.now();
    
    res.on('finish', () => {
        const duration = Date.now() - start;
        const message = `${req.method} ${req.originalUrl} ${res.statusCode} ${duration}ms`;
        
        logger.info(message);
    });
    
    next();
});
app.use(cors())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())



const route = require('./routes');
app.use('/', route);

const port = process.env.API_PORT || 8000;
app.listen(port, () => {
    logger.info(`Server running on ${port}`)
});


