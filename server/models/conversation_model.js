const mongoose = require('mongoose')

const conversationSchema = new mongoose.Schema({
    members:{type:Array,required:true},
}, {
    timestamps: true
})

const conversationCollection = mongoose.model('conversation',conversationSchema,'conversations')

module.exports = conversationCollection