const mongoose = require('mongoose')

const messageSchema = new mongoose.Schema({
    conversation_id:{type:String,required:true},
    sender_id:{type:String,required:true},
    text:{type:String,required:true},
}, {
    timestamps: true
})

const messageCollection = mongoose.model('message',messageSchema,'messages')

module.exports = messageCollection