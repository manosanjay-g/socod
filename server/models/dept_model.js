const mongoose = require('mongoose')

const deptSchema = new mongoose.Schema({
    name:{type:String,required:true},
    block:{type:String,required:true},
}, {
    timestamps: true
})

const deptCollection = mongoose.model('dept',deptSchema,'depts')

module.exports = deptCollection