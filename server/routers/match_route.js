const express = require('express');
const router = express.Router()

const {likePerson,unlikePerson} = require('../controllers/match_controller')

router.post('/like');
router.post('/unlike');

module.exports = router;