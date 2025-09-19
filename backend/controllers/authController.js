const User=require("../models/user");
const bcrypt=require("bcryptjs");
const jwt=require("jsonwebtoken");

const registerUser=async(req, res)=>{
    try{
        const {name, email, password}=req.body;

        const existingUser=await User.findOne({email:email});
        if(existingUser){
            res.status(400).json({
                message:"User already Exist",
            })
        }else{
            const hashedPassword=await bcrypt.hash(password,10);

            const user =await User.create({
                name,
                email,
                password:hashedPassword,
            });
            res.status(201).json({
                message:"User registered successfully",
                user:{
                    id:user._id,
                    name:user.name,
                    email:user.email,
                },
            })
        }
    }catch(error){
        res.status(500).json({
            message:"Server Error",
            error:error.message,
        })
    }
}

const loginUser=async(req, res)=>{
    try{
        // Destructure email and password from the request body
        const {email, password}=req.body;

        // Find the user in the database by email
        const user=await User.findOne({email});
        if(!user){
            // If user not found, send a 400 response
            res.status(400).json({
                message:"User not found",
            });
            return;
        }

        // Compare the provided password with the hashed password in the database
        const isValidPassword=await bcrypt.compare(password, user.password);
        if(!isValidPassword){
            return res.status(400).json({
                message:"Invalid password",
            })
        }

        const token=jwt.sign(
            {id:user._id},
            process.env.JWT_SECRET,
            {expiresIn:"1d"}
        )

        res.json({
            message:"Login successful",
            user,
            token,
        })
        // You can continue with further logic here (e.g., generating JWT, sending success response)
    } catch(error) {
        // Handle server errors
        res.status(500).json({
            message:"Server Error",
            error:error.message,
        });
    }
}

module.exports={registerUser, loginUser};