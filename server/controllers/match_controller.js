const userModel = require('../models/user_model')
const activityModel = require('../models/activity_model')
const conversationModel = require('../models/conversation_model')
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
        const oldLikeActivity = await activityModel.findOne({
            giver_id,
            receiver_id
        })
        if (oldLikeActivity) {
            return res.status(201).json({
                error: "Like Activity already present"
            })
        }
        const likeActivity = await activityModel.create({
            type: "like",
            giver_id,
            receiver_id
        })

        const similarActivity = await activityModel.findOne({ giver_id: receiver_id, receiver_id: giver_id })

        console.log(similarActivity);

        if (similarActivity) {

            const user1 = await userModel.findOneAndUpdate({ _id: giver_id }, {
                $addToSet: { matched: receiver_id }
            })
            const user2 = await userModel.findOneAndUpdate({ _id: receiver_id }, {
                $addToSet: { matched: giver_id }
            })
            await activityModel.create({
                type: "match",
                giver_id,
                receiver_id
            })
            await conversationModel.create({
                members: [giver_id, receiver_id]
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
        const unlikeActivity = await activityModel.create({
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

const getRecommendations = async (req, res) => {
    const id = req.params.id;

    if (!id) {
        return res.status(400).json({
            error: "All inputs are required"
        })
    }

    const user = await userModel.findOne({ _id: id });
    console.log(user.gender_interest);
    console.log(user.gender);
    console.log(user._id.toString());
    const recommendations = await userModel.find({ gender: user.gender_interest, gender_interest: user.gender});

    const filteredRecommendations = recommendations.filter((e)=>{
        if(!(user.liked.includes(e._id.toString()) || user.unliked.includes(e._id.toString()) || user.matched.includes(e._id.toString()))){
            return e;
        }
    })

    return res.status(200).json({ filteredRecommendations })
}

module.exports = {
    likePerson,
    unlikePerson,
    getRecommendations
}