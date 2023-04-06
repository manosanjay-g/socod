const express = require('express')
const router = express.Router()
const {readUser, updateUser, deleteUser, readUsers, deleteUsers} = require('../controllers/user_controller')
const { registerUser } = require('../controllers/auth_controller')
const { getActivities, getUserActivities, getLikesActivity, getUnlikesActivity, getMatchesActivity } = require('../controllers/activity_controller')
const { readDepts, readDept, createDept, updateDept, deleteDept } = require("../controllers/dept_controller")

//User Related
router.post('/users/',registerUser);
router.get('/users/',readUsers);
router.get('/users/:id',readUser);
router.patch('/users/:id',updateUser);
router.delete('/users/',deleteUsers);
router.delete('/users/:id',deleteUser);

//Department Related
router.post("/depts/",createDept)
router.get("/depts/",readDepts)
router.get("/depts/:id",readDept)
router.patch("/depts/:id",updateDept)
router.delete("/depts/:id",deleteDept)

//Activity Related
router.get('/activities/',getActivities)
router.get('/activities/:id',getUserActivities)
router.get('/likes/',getLikesActivity)
router.get('/unlikes/',getUnlikesActivity)
router.get('/matches/',getMatchesActivity)

module.exports = router