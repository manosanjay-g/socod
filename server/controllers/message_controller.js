const messageModel = require("../models/message_model")

const getMessages = async(req,res) => {
    try{
        const {conversation_id} = req.body

        if(!(conversation_id)){
            return res.status(400).json({
                error:"All inputs are required"
            })
        }

        const messages = await messageModel.find({conversation_id});

        return res.status(200).json({messages})
    }catch(error){
        console.log(error);
    }
}

const createMessage = async(req,res) => {
    try{
        const {conversation_id,sender_id,text} = req.body
        if(!(conversation_id && sender_id && text)){
            return res.status(400).json({
                error:"All inputs are required"
            })
        }

        const message = await messageModel.create({
            conversation_id,
            sender_id,
            text
        })

        return res.status(200).json({message})
    }catch(error){
        console.log(error);
    }
}

module.exports = {
    getMessages,
    createMessage
}