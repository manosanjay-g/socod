const userModel = require('../models/user_model')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')

const registerUser = async (req, res) => {
    try {
        const { name, gender, gender_interest, bio, interests, phone, email, password, dept_id, year, roles } = req.body
        if (!(name && gender && bio && email && password && dept_id && year && gender_interest && roles)) {
            return res.status(400).json({
                message: "All Fields are required",
                res: null
            })
        }
        if (!(email.includes('rajalakshmi.edu.in'))) {
            return res.status(400).json({
                message: "Must have an REC email",
                res: null
            })
        }
        const oldUser = await userModel.findOne({ email });
        if (oldUser) {
            return res.status(409).json({
                message: "User already exists",
                res: null
            })
        }

        encryptedPassword = await bcrypt.hash(password, 15);

        const user = await userModel.create({
            name,
            gender,
            gender_interest,
            bio,
            interests,
            phone,
            email: email.toLowerCase(),
            password: encryptedPassword,
            dept_id,
            year,
            roles
        })
        const token = jwt.sign({
            user_id: user._id,
            email
        }, process.env.JWT_KEY)
        user.token = token;
        user.save()
        res.status(201).json({
            message: "Account created",
            res: user._id
        })
    } catch (err) {
        console.log(err);
    }
}
const loginUser = async (req, res) => {
    try {
        const { email, password } = req.body
        if (!(email && password)) {
            return res.status(400).json({
                message: "All fields are required",
                res: null
            })
        }
        const user = await userModel.findOne({ email });
        if (user == null) {
            return res.status(409).json({
                message: "User does not exists",
                res: null
            })
        }
        if (!user.verified) {
            return res.status(400).json({
                message: "User is not verified",
                res: null
            })
        }

        decryptedPassword = await bcrypt.compare(password, user.password);
        if (user && decryptedPassword) {
            const token = jwt.sign({
                user_id: user._id,
                email
            }, process.env.JWT_KEY)
            user.token = token;
            user.save();
            return res.status(200).json({
                message: "User logged in",
                res: {
                    id: user._id,
                    token: user.token
                }
            });
        }
        res.status(400).json({
            message: "Invalid credentials",
            res: null
        })
    } catch (err) {
        console.log(err);
    }
}

module.exports = {
    registerUser,
    loginUser
}