const userModel = require('../models/user_model')
const activity_model = require('../models/activity_model')

const likePerson = async (req, res) => {
    try {
        const { giver_id, receiver_id } = req.body
        if (!(giver_id && receiver_id)) {
            return res.status(400).json({
                error: "All inputs are required"
            })
        }

        const user = await userModel.findByIdAndUpdate({ _id: giver_id }, {
            $addToSet: { liked: receiver_id }
        })
        const oldLikeActivity = await activity_model.findOne({
            giver_id,
            receiver_id
        })
        if (oldLikeActivity) {
            return res.status(201).json({
                error:"Like Activity already present"
            })
        }
        const likeActivity = await activity_model.create({
            type: "like",
            giver_id,
            receiver_id
        })

        const similarActivity = await activity_model.findOne({ giver_id: receiver_id, receiver_id: giver_id })
        
        console.log(similarActivity);
        
        if (similarActivity) {

            const user1 = await userModel.findOneAndUpdate({ _id: giver_id }, {
                $addToSet: { matched: receiver_id }
            })
            const user2 = await userModel.findOneAndUpdate({ _id: receiver_id }, {
                $addToSet: { matched: giver_id }
            })

            console.log(`${user1.name} matched with ${user2.name}`);

        }
        res.status(201).json({
            user,
            likeActivity
        })
    } catch (error) {
        console.log(error);
    }
}

const unlikePerson = async (req, res) => {
    try {
        const { giver_id, receiver_id } = req.body
        if (!(giver_id && receiver_id)) {
            return res.status(400).json({
                error: "All inputs are required"
            })
        }
        const user = userModel.findByIdAndUpdate({ _id: giver_id }, {
            $addToSet: { unliked: receiver_id }
        })
        const unlikeActivity = await activity_model.create({
            type: "unlike",
            giver_id,
            receiver_id
        })
        res.status(201).json({
            user,
            unlikeActivity
        })
    } catch (error) {
        console.log(error);
    }
}



module.exports = {
    likePerson,
    unlikePerson,
}