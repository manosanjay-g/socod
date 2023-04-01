const mongoose = require('mongoose')

const activitySchema = new mongoose.Schema({
    type:{type:String,required:true},
    giver_id:{type:String,required:true},
    receiver_id:{type:String,required:true},
}, {
    timestamps: true
})

const activityCollection = mongoose.model('activity',activitySchema,'activities')

module.exports = activityCollection