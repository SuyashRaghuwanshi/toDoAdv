const toDO=require('../models/toDO');

const createTodo=async(req, res)=>{
    try{
        const {task, description}=req.body;
        const userId=req.user.id;
        const todo=await toDO.create({
            task,
            description,
            user:userId
        });
        res.status(201).json({
            message:"ToDo created successfully",
            todo,
        })
    }catch(error){
        res.status(500).json({
            message:"Server Error",
            error:error.message,
        })
    }
}

const getTodo=async(req, res)=>{
    try{
        const todos=await toDO.find({user:req.user.id}).populate("user","name email");
        res.json(todos);
    }catch (error) {
    res.status(500).json({ message: error.message });
    }
}

const getById=async(req, res)=>{
    try{
        console.log("Params:", req.params);
        const {id}=req.params;
        console.log(id);
        if(!id){
            return res.status(401).json({message:"Unauthorized"});
        }
        const todos= await toDO.find({user:id});
        res.status(200).json(todos);
    }catch(error){
        res.status(500).json({
            message:"Server error",
            error: error.message,
        })
    }
}
module.exports={createTodo, getTodo, getById};