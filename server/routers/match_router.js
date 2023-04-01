const express = require('express');
const router = express.Router()

const {likePerson,unlikePerson} = require('../controllers/match_controller')

router.post('/like',likePerson);
router.post('/unlike',unlikePerson);

module.exports = router;