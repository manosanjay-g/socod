const userModel = require('../models/user_model')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')

const registerUser = async(req,res)=>{
    try{
        const {name,gender,bio,interests,phone,email,password,dept_id,year} = req.body
        if(!(name && gender && bio && phone && email && password && dept_id && year)){
            return res.status(400).json({
                error:"All fields are required"
            })
        }
        const oldUser = await userModel.findOne({email});
        if(oldUser){
            return res.status(409).json({
                error:"User already exists"
            })
        }

        encryptedPassword = await bcrypt.hash(password,15);

        const user = await userModel.create({
            name,
            gender,
            bio,
            interests,
            phone,
            email:email.toLowerCase(),
            password:encryptedPassword,
            dept_id,
            year
        })
        const token = jwt.sign({
            user_id:user._id,
            email
        }, process.env.JWT_KEY)
        user.token = token;
        res.status(201).json(user)
    }catch(err){
        console.log(err);
    }
}
const loginUser = async(req,res)=>{
    try{
        const {email,password} = req.body
        if(!( email && password)){
            return res.status(400).json({
                error:"All fields are required"
            })
        }
        const user = await userModel.findOne({email});
        if(user == null){
            return res.status(409).json({
                error:"User does not exist"
            })
        }

        decryptedPassword = await bcrypt.compare(password,user.password);
        if(user && decryptedPassword){
            const token = jwt.sign({
                user_id: user._id,
                email
            }, process.env.JWT_KEY)
            user.token = token;
            return res.status(200).json(user);
        }
        res.status(400).json({
            error: "Invalid Credentials"
        })
    }catch(err){
        console.log(err);
    }
}

module.exports = {
    registerUser,
    loginUser
}