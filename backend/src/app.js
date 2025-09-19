const express=require("express");
const cors=require("cors");
const dotenv=require("dotenv");

const mongoose=require("mongoose");
const connectDb=require("../config/db");
dotenv.config();
const app=express();

const authRouter=require("../routes/authRoutes");
const todoRouter=require("../routes/todoRoutes");
app.use(cors());
app.use(express.json());// we are sending json data to backend
app.use(express.urlencoded({extended:true}));// we are sending form data to backend

app.use("/auth", authRouter);
app.use("/todo", todoRouter);
connectDb()
module.exports=app;