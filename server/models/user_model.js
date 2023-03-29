const mongoose = require('mongoose')

const userSchema = new mongoose.Schema({
    name:{type:String,required:true},
    gender:{type:String,required:true},
    bio:{type:String,required:true},
    interests:{type:Array,default:[]},
    email:{type:String,required:true},
    password:{type:String,required:true},
    dept_id:{type:Number,required:true},
    year:{type:Number,required:true},
    liked:{type:Array,default:[]},
    unliked:{type:Array,default:[]},
    matched:{type:Array,default:[]}
}, {
    timestamps: true
})

const userCollection = mongoose.model('user',userSchema,'users')

module.exports = userCollection