const userModel = require('../models/user_model')
const verifyRoles =  (allowedRoles) => {
    return async (req,res,next) => {
        const roles = [...allowedRoles];
        const {id} = req.body;
        const user = await userModel.findById({_id:id});
        const result = user.roles.map((role)=>roles.includes(role)).find((val)=>val===true);
        if(!result){
            return res.status(401).json({
                message:"User is not authorized to hit this endpoint"
            })
        }
        next();
    }
}

module.exports = {
    verifyRoles
}