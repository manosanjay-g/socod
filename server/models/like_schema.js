const mongoose = require('mongoose')

const likeSchema = new mongoose.Schema({
    giver_id:{type:String,required:true},
    receiver_id:{type:String,required:true},
}, {
    timestamps: true
})

const likeCollection = mongoose.model('like',likeSchema,'likes')

module.exports = likeCollection