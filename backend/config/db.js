const mongoose=require("mongoose");

const connectDB = async () => {
    try {
        await mongoose.connect("mongodb://localhost:27017/toDoLearn"),{
            newUrlParser:true,
            useUnifiedTopology:true,
        }
        console.log("MongoDB connected");
        
    }catch(error){
        console.log(error);
        process.exit(1);
    }
};

module.exports=connectDB;