const deptModel = require('../models/dept_model')

const createDept = async(req,res) => {
    try {
        const {name,block} = req.body
        if(!(name && block)){
            return res.status(400).json({
                error:"All inputs are required"
            })
        }
        const oldDept = await deptModel.findOne({name})
        if(oldDept){
            res.status(409).json({
                error:"Department already exists"
            })
        }
        const dept = await deptModel.create({
            name,
            block
        })

        return res.status(200).json({dept})

    } catch (error) {
        console.log(error);
    }
}

const readDept = async(req,res) => {
    try {
        const id = req.params.id
        if (!id) {
            return res.status(400).json({
                error: "All inputs are required"
            })
        }
        const dept = await deptModel.findOne({_id:id})
        if(!dept){
            return res.status(409).json({
                error:"Department does not exists"
            })
        }
        return res.status(200).json({dept})

    } catch (error) {
        console.log(error);
    }
}
const readDepts = async(req,res) => {
    try {
        const dept = await deptModel.find({})
        if(!dept){
            return res.status(409).json({
                error:"Departments does not exists"
            })
        }
        return res.status(200).json({dept})

    } catch (error) {
        console.log(error);
    }
}

const updateDept = async(req,res) => {
    try {
        const id = req.params.id
        const {name,block} = req.body
        if(!(name && block )){
            return res.status(400).json({
                error:"All inputs are required"
            })
        }
        
        const dept = await deptModel.findByIdAndUpdate({_id:id},{
            name,
            block
        })

        return res.status(200).json({dept})
    } catch (error) {
        console.log(error);
    }
}

const deleteDept = async(req,res) => {
    try {
        const id = req.params.id
        if (!id) {
            return res.status(400).json({
                error: "All inputs are required"
            })
        }
        const deletedDepartment = await deptModel.deleteOne({ _id: id })
        res.status(204).json({ deletedDepartment })
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    createDept,
    readDept,
    updateDept,
    deleteDept,
    readDepts
}