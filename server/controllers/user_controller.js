const userModel = require('../models/user_model')

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
        const { name, gender, gender_interest, bio, interests, phone, year } = req.body
        if (!(name && gender && bio && phone && year && gender_interest)) {
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
        res.status(204).json({ deletedUser })
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    readUsers,
    readUser,
    deleteUser,
    updateUser,
}