const router = require('express').Router();
const user = require('../controllers/auth.controller');
const auth = require('../middlewares/auth');
// register

router.route("/").get(auth ,user.all).post(user.register).delete(user.down)
router.delete("/logout", (req,res,next) => {res.status(200).json({status:true})})
router.post('/login', user.login);
// all users

module.exports = router;