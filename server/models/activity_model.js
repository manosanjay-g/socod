const mongoose = require('mongoose')

const likeSchema = new mongoose.Schema({
    type:{type:String,required:true},
    giver_id:{type:String,required:true},
    receiver_id:{type:String,required:true},
}, {
    timestamps: true
})

const likeCollection = mongoose.model('like',likeSchema,'likes')

module.exports = likeCollection