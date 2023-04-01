const express = require('express')
const router = express.Router()

const {readUser, updateUser, deleteUser, readUsers} = require('../controllers/user_controller')
const { registerUser } = require('../controllers/auth_controller')
const { getActivities, getUserActivities, getLikesActivity, getUnlikesActivity, getMatchesActivity } = require('../controllers/activity_controller')

router.post('/users/',registerUser);
router.get('/users/',readUsers);
router.get('/users/:id',readUser);
router.patch('/users/:id',updateUser);
router.delete('/users/:id',deleteUser);
router.get('/activities/',getActivities)
router.get('/activities/:id',getUserActivities)
router.get('/likes/',getLikesActivity)
router.get('/unlikes/',getUnlikesActivity)
router.get('/matches/',getMatchesActivity)

module.exports = router