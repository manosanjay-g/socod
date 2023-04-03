const express = require('express');
const router = express.Router()

const {likePerson,unlikePerson, getRecommendations} = require('../controllers/match_controller')

router.post('/like',likePerson);
router.post('/unlike',unlikePerson);
router.get('/recommendations/:id',getRecommendations)

module.exports = router;