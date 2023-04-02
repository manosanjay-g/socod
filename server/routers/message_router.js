const express = require('express')
const router = express.Router()

const { getMessages, createMessage, getConversations } = require('../controllers/message_controller')

router.get('/:id',getConversations);
router.get('/',getMessages);
router.post('/',createMessage);
module.exports = router