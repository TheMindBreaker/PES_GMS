const createError = require('http-errors');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const dbEventEmitter = require('../../utils/eventHandler');

require('dotenv').config();
const jwt = require('../../utils/jwt');
const { use } = require('../routes');

class gensetController {
    static specific = (req, res, next) => {
        try {
            prisma.genset.findUnique({
                where: {
                    id: parseInt(req.params.id)
                },
                include: {
                    genset03: true,
                    genset01: true
                }
            }).then((data)=> {
                res.status(200).json({
                    status: true,
                    message: "Sucess",
                    data
                })
            })
        } catch (e){
            next(createError(e.statusCode, e.message))
        }
    }

    static all = (req, res, next) => {
        try {
            prisma.genset.findMany({
                include: {
                    genset03: {
                        select: {
                            //Mains
                            p0: true,
                            p1: true,
                            p2: true,
                            p6: true,
                            //Gen
                            p7: true,
                            p8: true,
                            p9: true,
                            p13: true,
                            // Speed, Batery and Fuel
                            p23: true,
                            p21: true,
                            p24: true,
                            p34: true
                        }
                    },
                }
            }).then(data => {
                res.status(200).json({
                    status: true,
                    message: "Sucess",
                    data
                })
            }).catch(e => {
                next(createError(e.statusCode, e.message))
            })
        }
        catch (e) {
            next(createError(e.statusCode, e.message))
        }
    }

    static some = (req, res, next) => {
        try {
            let company = req.user.payload.companyId
            prisma.genset.findMany({
                where: {
                    companyId: company
                },
                include: {
                    genset03: {
                        select: {
                            //Mains
                            p0: true,
                            p1: true,
                            p2: true,
                            p6: true,
                            //Gen
                            p7: true,
                            p8: true,
                            p9: true,
                            p13: true,
                            // Speed, Batery and Fuel
                            p23: true,
                            p21: true,
                            p24: true,
                            p34: true
                        }
                    },
                }

            }).then(data => {
                res.status(200).json({
                    status: true,
                    message: "Sucess",
                    data
                })
            }).catch(e => {
                next(createError(e.statusCode, e.message))
            })
        } catch (e) {
            next(createError(e.statusCode, e.message))
        }


    }

    static create = (req, res, next) => {
        try {
            const data = req.body
            prisma.genset.create({ data }).then(result => {
                res.status(200).json({
                    status: true,
                    message: "Sucess",
                    data: result
                })
            }).catch(e => {
                if (e.code == "P2002") next(createError[409]("Unit Exists"))
                else next(createError[500](e.code))
            })
        }
        catch (e) {
            next(createError(e.statusCode, e.message))
        }
    }
}

module.exports = gensetController;