const activity_model = require('../models/activity_model')

const getActivities = async(req,res) => {
    try {
        const activities = await activity_model.find({})

        return res.status(200).json({
            activities
        })
    } catch (error) {
        console.log(error);
    }
}

const getUserActivities = async(req,res) => {
    try {
        const id = req.params.id;

        const user_activities = await activity_model.find({giver_id:id})

        return res.status(200).json({
            user_activities
        })
    } catch (error) {
        console.log(error);
    }
}

const getLikesActivity = async(req,res) => {
    try {

        const like_activities = await activity_model.find({type:"like"})

        return res.status(200).json({
            like_activities
        })
    } catch (error) {
        console.log(error);
    }
}

const getUnlikesActivity = async(req,res) => {
    try {

        const unlikes_activity = await activity_model.find({type:"unlike"})

        return res.status(200).json({
            unlikes_activity
        })
    } catch (error) {
        console.log(error);
    }
}

const getMatchesActivity = async(req,res) => {
    try {

        const match_activity = await activity_model.find({type:"match"})

        return res.status(200).json({
            match_activity
        })
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    getActivities,
    getUserActivities,
    getLikesActivity,
    getMatchesActivity,
    getUnlikesActivity
}