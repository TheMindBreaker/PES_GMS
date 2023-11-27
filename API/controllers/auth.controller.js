const createError = require('http-errors');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

require('dotenv').config();
const bcrypt = require('bcryptjs');
const jwt = require('../../utils/jwt');


class authController {
    static register = (req, res, next) => {
        try {
            let data = req.body
            data.password = bcrypt.hashSync(data.password, 8)
            prisma.user.create({data}).then((result) => {
                data.token = jwt.signAccessToken(result)
                res.status(200).json({
                    status: true,
                    message: "User Created",
                    data
                })
            }).catch((e) => {
                if (e.code == "P2002") next(createError[409]("User Exists"))
                else next(createError[500](e.code))
            })
        } catch (e) {
            next(createError(e.statusCode, e.message))
        }
        
    }
    static login = (req, res, next) => {
         try {
            const {email, password} = req.body
            prisma.user.findUnique({where: {email}}).then((data) => {
                console.log(data)
                if(!data) {next(createError.NotFound("User Not Founded"))}
                else {
                    if(!bcrypt.compareSync(password, data.password)) {
                        next(createError.Unauthorized("User not registered"))
                    } else {
                        jwt.signAccessToken(data).then((token) => {
                            res.status(200).json({
                                    status: true,
                                    message: "Sucess",
                                    token: token,
                                    data
                                })
                        })
                        
                    }
                }
            })
        } catch (e) {
            next(createError(e.statusCode, e.message))
        }
    }
    static all = (req, res, next) => {
        try {
            prisma.user.findMany().then((data) => {
                res.status(200).json({
                    status: true,
                    message: null,
                    data
                })
            })
        }
        catch (e) {
            next(createError(e.statusCode, e.message))
        }
    }
    static down = (req, res, next) => {
        try {
            prisma.user.update({ where: {email: req.body.email}, data: {userStatus: false}}).then((data) => {
                res.status(200).json({
                    status: true,
                    message: "User Deleted",
                    data
                })
            }). catch((e) => next(createError(e.statusCode, e.message)))
        } 
        catch (e) {
            next(createError(e.statusCode, e.message))
        }
    }
}
module.exports = authController;