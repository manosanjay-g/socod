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

module.exports = {
    getActivities,
    getUserActivities,
}