const express = require('express')
const router = express.Router()

const {readUser} = require('../controllers/user_controller')

router.get('/:id',readUser);

module.exports = router