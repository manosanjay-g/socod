const userModel = require('../models/user_model')
const activityModel = require("../models/activity_model")
const messageModel = require('../models/message_model');
const conversationModel = require('../models/conversation_model');
const rolesList = require('../configs/roles_config')
const readUsers = async (req, res) => {
    try {

        const users = await userModel.find({  })
        
        return res.status(200).json({
            users
        })
    } catch (error) {
        console.log(error);
    }
}
const readUser = async (req, res) => {
    try {
        const id = req.params.id

        if (!id) {
            return res.status(400).json({
                error: "All inputs are required"
            })
        }

        const user = await userModel.findOne({ _id: id })
        if (!user) {
            return res.status(409).json({
                error: "User does not exists"
            })
        }
        return res.status(200).json({
            user
        })
    } catch (error) {
        console.log(error);
    }
}

const updateUser = async (req, res) => {
    try {
        const id = req.params.id
        const { name, gender, gender_interest, bio, interests, phone, year} = req.body
        if (!(name && gender && bio && phone && year && gender_interest )) {
            return res.status(400).json({
                error: "All fields are required"
            })
        }
        const user = await userModel.findByIdAndUpdate({ _id: id }, {
            name,
            gender, 
            bio, 
            phone, 
            year, 
            gender_interest, 
            interests,
        })
        return res.status(201).json({user})
    } catch (error) {
        console.log(error);
    }
}

const deleteUser = async (req, res) => {
    try {
        const id = req.params.id
        const deletedUser = await userModel.deleteOne({ _id: id })
        
        await activityModel.deleteMany({giver_id:id})
        await activityModel.deleteMany({receiver_id:id})

        const userConvo = await conversationModel.find({members:{$in:[id]}})

        await messageModel.deleteMany({conversation_id:userConvo._id});

        await conversationModel.deleteMany({members:{$in:[id]}});

        res.status(204).json({ deletedUser })
    } catch (error) {
        console.log(error);
    }
}
const deleteUsers = async (req, res) => {
    try {
        const deletedUsers = await userModel.deleteMany({roles:{$nin:rolesList.Admin}});
        
        await activityModel.deleteMany({});
        await activityModel.deleteMany({});

        await conversationModel.deleteMany({});
        await messageModel.deleteMany({});

        res.status(204).json({ deletedUsers })
        
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    readUsers,
    readUser,
    updateUser,
    deleteUser,
    deleteUsers,
}