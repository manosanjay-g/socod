const express = require('express')
const app = express()
const cors = require('cors')
const roleList = require('./configs/roles_config')
require('dotenv').config()

//Router Initialization
const authRouter = require('./routers/auth_router')
const matchRouter = require('./routers/match_router')
const userRouter = require('./routers/user_router')
const adminRouter = require('./routers/admin_router')
const messageRouter = require('./routers/message_router')
const verificationRouter = require('./routers/verification_router')

//DB Init
const connectDB = require('./configs/database_config')

//Middleware Initialization
const {verifyRoles} = require('./middlewares/verify_roles_middleware') 
const {authenticateToken} = require('./middlewares/auth_middleware')
//Middlewares
app.use(cors())
app.use(express.json())
app.use('/public',express.static('public'))

//Routes
app.use('/auth',authRouter);
app.use('/match',authenticateToken,verifyRoles([roleList.User]),matchRouter);
app.use('/users',authenticateToken,verifyRoles([roleList.User]),userRouter);
app.use('/admin',authenticateToken,verifyRoles([roleList.Admin]),adminRouter);
app.use('/messages',authenticateToken,verifyRoles([roleList.User]),messageRouter);
app.use('/verification',verificationRouter)

app.get('/',(req,res)=>{
    res.send('SOCOD');
})

const start = async () => {
    try{
        await connectDB(process.env.MONGODB_URI)
        app.listen(process.env.PORT,()=>{
            console.log(`Server listening on PORT ${process.env.PORT}`);
        })
    }catch(err){
        console.log(err);
        process.exit(1);
    }
}
start()