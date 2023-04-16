const messageModel = require("../models/message_model")
const conversationModel = require('../models/conversation_model')
const getConversations = async(req,res) => {
    try{
        const id = req.params.id

        if(!(id)){
            return res.status(400).json({
                message:"All fields are required",
                res:null
            })
        }

        const conversations = await conversationModel.find({members:{
            $in:id
        }});

        return res.status(200).json({
            message:"Conversations retrieved",
            res:conversations
        })
    }catch(error){
        console.log(error);
    }
}

const getMessages = async(req,res) => {
    try{
        const {conversation_id} = req.body

        if(!(conversation_id)){
            return res.status(400).json({
                message:"All fields are required",
                res:null
            })
        }

        const messages = await messageModel.find({conversation_id});

        return res.status(200).json({
            message:"Messages retrieved",
            res:messages
        })
    }catch(error){
        console.log(error);
    }
}

const createMessage = async(req,res) => {
    try{
        const {conversation_id,sender_id,text} = req.body
        if(!(conversation_id && sender_id && text)){
            return res.status(400).json({
                message:"All fields are required",
                res:null
            })
        }

        const message = await messageModel.create({
            conversation_id,
            sender_id,
            text
        })

        return res.status(200).json({
            message:"Message sent",
            res:message
        })
    }catch(error){
        console.log(error);
    }
}

module.exports = {
    getMessages,
    createMessage,
    getConversations
}