const express = require('express')
const app = express()
const cors = require('cors')
require('dotenv').config()

//Router Initialization
const authRouter = require('./routers/auth_router')
const matchRouter = require('./routers/match_router')
const userRouter = require('./routers/user_router')
const adminRouter = require('./routers/admin_router')
const messageRouter = require('./routers/message_router')

//DB Init
const connectDB = require('./configs/database_config')

//Middleware Initialization

//Middlewares
app.use(cors())
app.use(express.json())
app.use('/public',express.static('public'))

//Routes
app.use('/auth',authRouter);
app.use('/match',matchRouter);
app.use('/users',userRouter);
app.use('/admin',adminRouter);
app.use('/messages/',messageRouter);

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