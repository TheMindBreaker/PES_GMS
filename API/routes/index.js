const express = require('express');
const router = express.Router();
const createError = require('http-errors')
const auth = require("../middlewares/auth")
router.get('/', (req, res) => {
    res.send('Hello World!');
});

router.use('/auth', require("./auth"));
router.use("/genset",auth, require("./gensets"))




router.use( async (req, res, next) => {
    next(createError.NotFound('Route not Found: '+ req.path))
})
router.use( (err, req, res, next) => {
    res.status(err.status || 500).json({
        status: false,
        message: err.message
    })
})
module.exports = router;