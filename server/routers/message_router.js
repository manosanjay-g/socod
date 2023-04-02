const express = require('express')
const router = express.Router()

const { getMessages, createMessage } = require('../controllers/message_controller')

router.get('/',getMessages);
router.post('/',createMessage);
module.exports = router