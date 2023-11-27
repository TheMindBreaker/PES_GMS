const router = require('express').Router();
const genset = require('../controllers/genset.controller');
// register

router.route("/").get(genset.all).post(genset.create)
// all users

router.get("/some",genset.some)
router.get("/gen/:id", genset.specific)
module.exports = router;