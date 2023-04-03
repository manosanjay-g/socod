const otpModel = require('../models/otp_model')
const userModel = require('../models/user_model')
const bcrypt = require('bcryptjs')
const nodemailer = require('nodemailer')
require('dotenv').config()

let transporter = nodemailer.createTransport({
    service:"gmail",
    user:"smtp.gmail.com",
    port:465,
    secure:true,
    auth:{
        type:"login",
        user:process.env.AUTH_EMAIL,
        pass:process.env.AUTH_PASS
    }
})

const sendOTP = async(req,res)=>{
    try {
        const {user_id,email} = req.body
        const otp = `${Math.floor(1000 + Math.random() * 9000)}`
        if(!user_id){
            return res.status(400).json({
                error:"All inputs are required"
            })
        }
        const mailConfig = {
            from:process.env.AUTH_EMAIL,
            to:email,
            subject:"Verify your Email | SOCOD",
            html:`<p>Enter <b>${otp}</b> in the app to verify your email address and complete your signup process</p><br/><p>This code <b>expires in 1hr</b></p>`
        }
        const hashedOTP = await bcrypt.hash(otp,15);

        const otpForUser = await otpModel.findOneAndUpdate({user_id},{
            user_id,
            otp:hashedOTP,
            created_at:Date.now(),
            expires_at:Date.now() + 3600000
        },{upsert:true})
        
        await transporter.sendMail(mailConfig);

        return res.status(200).json({
            status:"Pending",
            message:"Verification email sent",
            data:{
                user_id, 
                email
            }
        })
    } catch (error) {
        console.log(error);
    }
}

const verifyOTP = async(req,res)=>{
    try {
        const {user_id,otp} = req.body
        if(!(user_id && otp)){
            return res.status(400).json({
                error:"All inputs are required"
            })
        }
        const userOTP = await otpModel.findOne({user_id})

        if(!userOTP){
            return res.status(400).json({
                error:"OTP hasn't been generated.Generate OTP"
            })
        }

        if(userOTP.expires_at < Date.now()){
            return res.status(400).json({
                error:"OTP has expired"
            })
        }

        deHashedOTP = await bcrypt.compare(otp,userOTP.otp)

        if(!deHashedOTP){
            return res.status(400).json({
                error:"Wrong OTP"
            })
        }
        const user =await userModel.findByIdAndUpdate({_id:user_id},{
            verified:true
        })


        return res.status(200).json({
            user: user._id,
            status: user.verified
        })
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    sendOTP,
    verifyOTP
}