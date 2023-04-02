const express = require('express')
const router = express.Router()

const { getMessages, createMessage, getConversations } = require('../controllers/message_controller')

router.get('/',getMessages);
router.get('/:id',getConversations);
router.post('/',createMessage);
module.exports = router