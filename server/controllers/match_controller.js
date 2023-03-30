const userModel = require('../models/user_model')
const activity_model = require('../models/activity_model')

const likePerson = async(req,res)=>{
    try {
        const {giver_id,receiver_id} = req.body
        if(!(giver_id && receiver_id)){
            return res.status(400).json({
                error:"All inputs are required"
            })
        }
        const user = userModel.findByIdAndUpdate({_id:giver_id},{
            $push:{liked:receiver_id}
        })
        const likeActivity = await activity_model.create({
            type:"like",
            giver_id,
            receiver_id
        })
        res.status(201).json({
            user,
            likeActivity
        })
    } catch (error) {
        console.log(error);
    }
}

const unlikePerson = async(req,res) =>{
    try {
        const {giver_id,receiver_id} = req.body
        if(!(giver_id && receiver_id)){
            return res.status(400).json({
                error:"All inputs are required"
            })
        }
        const user = userModel.findByIdAndUpdate({_id:giver_id},{
            $push:{unliked:receiver_id}
        })
        const unlikeActivity = await activity_model.create({
            type:"unlike",
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

const matchPerson = () => {
    try {
        
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    likePerson,
    unlikePerson,
    matchPerson
}