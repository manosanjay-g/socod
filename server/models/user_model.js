const mongoose = require('mongoose')

const userSchema = new mongoose.Schema({
    name: { type: String, required: true },
    img: { type: Array, default:[] },
    gender: { type: String, required: true },
    gender_interest: { type: String, required: true },
    bio: { type: String, required: true },
    interests: { type: Array, default: [] },
    phone: { type: Number, default:0 },
    email: { type: String, required: true },
    password: { type: String, required: true },
    dept_id: { type: String, required: true },
    token: { type: String, required: false },
    year: { type: String, required: true },
    liked: { type: Array, default: [] },
    unliked: { type: Array, default: [] },
    matched: { type: Array, default: [] },
    verified: { type: Boolean, default: false },
    roles:{type:Array,required:true}
}, {
    timestamps: true
})

const userCollection = mongoose.model('user', userSchema, 'users')

module.exports = userCollection