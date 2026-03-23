const express = require("express")
const app = express()
const axios = require("axios")
const jwt = require("jsonwebtoken")
const env = require("dotenv")
const crypto = require("crypto")
const bcrypt = require("bcrypt")

//setting up the .env file
env.config()

//creating random text to use that as payload for my jwt token
randomText = crypto.randomBytes(32).toString()

//hashing the secret key
hashedSecret = bcrypt.hashSync(process.env.secret,5)

//creating the token
token = jwt.sign(randomText,hashedSecret)

//getting the test script
const args = process.argv[2]

// using the middleware to pass the data
app.use(express.urlencoded({extended: true}))
app.use(express.json())

app.listen(3000,()=>{
    console.log("app is listning")
    if(args.includes("--test")){
        testFunc()
    }
})

async function testFunc(){
    //using Axios package to test my endpoint with my token and secret key
    await axios.post("http://localhost:3000/test",{secret: hashedSecret,token: token})
}

app.get("/",(req,res)=>{
    res.send("App connection establised")
})

app.post("/test",(req,res)=>{

    //getting the secret and token
    let secret = req.body.secret
    let token = req.body.token
    try{
        //verifying the jwt authentication
        jwt.verify(token,secret)

        console.log("App will be stopped as part of testing")

        //stop the app to avoid hung issue while testing
        process.exit(0)
    }
    catch(e){
        console.log("Unauthorized request")
    }
})