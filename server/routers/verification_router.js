const express = require('express')
const router = express.Router()

const { sendOTP, verifyOTP } = require('../controllers/verification_controller')

router.put('/sendotp',sendOTP);
router.post('/verifyotp',verifyOTP);

module.exports = router