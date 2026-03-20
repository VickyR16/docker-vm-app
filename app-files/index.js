const app = require("express")()

app.listen(3000,()=>{
    console.log("app is listning")
})

app.get("/",(req,res)=>{
    res.send("App connection establised")
})