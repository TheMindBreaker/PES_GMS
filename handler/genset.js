const { loggers } = require('winston')
const logger = loggers.get('gms')
const event = require("../utils/eventHandler")
const { PrismaClient } = require('@prisma/client')
require('dotenv').config()
const prisma = new PrismaClient()



function swapBytes(hexString) {
    // Split the string into chunks of two characters (one byte each)
    const bytes = hexString.match(/.{1,2}/g) || [];

    // Reverse the bytes and join back into a string
    return bytes.reverse().join('');
}


exports.offline = (val) => {
    prisma.genset.update({
        where: { hostid: val },
        data: {
            status: false
        }
    }).catch(e => logger.error(e))
}

exports.online = (val) => {
    prisma.genset.update({
        where: { hostid: val },
        data: {
            status: true,
        }
    }).catch(e => logger.error(e))
}

function parseModbusData(data) {
    genset01 = {}
    data.forEach(item => {
        const address = parseInt(Object.keys(item)[0], 16);
        const hexValue = Object.values(item)[0];
        const binaryString = parseInt(hexValue, 16).toString(2).padStart(8, '0');
        binaryString.split('').reverse().forEach((bit, index) => {
            genset01[`b${address + index}`] = bit === '1' ? true : false;
        });
    });
    return genset01
}

function processData(jsonData) {
    // Processing "01" - Read Coils
    let coilsData = { genset01: {}, genset03: {} };
    let i = 0
    if (jsonData.params["01"]) {
        coilsData.genset01 = parseModbusData(jsonData.params["01"])
    }

    // Processing "03" - Read Holding Registers
    if (jsonData.params["03"]) {
        jsonData.params["03"].forEach(item => {
            for (const [address, value] of Object.entries(item)) {
                const registerAddress = `p${parseInt(address, 16)}`;
                coilsData.genset03[registerAddress] = parseInt(swapBytes(value), 16);
            }
        });
    }
    return coilsData
}

exports.reqdatachange = async (json_object, socket) => {
    socket.write(JSON.stringify({ "method": "reqdata ", "message": "OK ", "retcode": "000000" }))
    let pdo = processData(json_object)

    prisma.genset.findFirst({
        where: {
            hostid: json_object.hostid
        }
    }).then(data => {
        prisma.genset03.update({
            where: {
                gensetId: data.id
            },
            data: pdo.genset03,
            include: true
        }).then(g1 => {
            prisma.genset01.update({
                where: {
                    gensetId: data.id
                },
                data: pdo.genset01,
                include: true
            }).then(g3 => event.emit("gensets", { hostid: json_object.hostid, data: { genset03: g3, genset01: g1 } })
            )
        })

    })




}


module.exports.login = (data, socket) => {
    prisma.genset.findFirst({ where: { hostid: data.hostid } }).then(gensetData => {
        socket.write(JSON.stringify(
            {
                "method": "login",
                "result": {
                    "register": 1,
                    "historic": process.env.HIST_SERVER,
                    "liveData": process.env.LIVE_SERVER,
                    "realTime": "UTC",
                    "para_command": "01010000004EBC3E;01030000002D85D7;0103002E000AA5C4",
                    "con_command": "01010000004EBC3E;01030000002D85D7;0103002E000AA5C4",
                    "online_rate": 3000,
                    "offline_rate": 3000,
                    "data_mode": 1,
                    "moduletype": "HGM6120N-4G",
                    "modulePort": 2,
                    "moduleBaud": 0,
                },
                "retcode": "000000"
            }
        ))
    });
};
let conf = { "method": "login", "result": { "register": 1, "historic": "8.136.108.133:21318", "liveData": "8.136.108.133:21318", "realTime": "1700872746", "para_command": "01010000005ABC31;01030000002D85D7;0103002E000AA5C4", "con_command": "01010000005ABC31;01030000002D85D7;0103002E000AA5C4", "online_rate": 3000, "offline_rate": 3000, "moduletype": "HGM6120N-4G", "modulePort": 2, "moduleBaud": 0 }, "retcode": "000000" }