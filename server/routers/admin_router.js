const express = require('express')
const router = express.Router()

const {readUser, updateUser, deleteUser, readUsers} = require('../controllers/user_controller')
const { registerUser } = require('../controllers/auth_controller')

router.post('/users/',registerUser);
router.get('/users/',readUsers);
router.get('/users/:id',readUser);
router.patch('/users/:id',updateUser);
router.delete('/users/:id',deleteUser);

module.exports = router