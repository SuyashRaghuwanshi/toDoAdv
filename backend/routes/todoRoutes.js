const {Router}= require('express');
const router=Router();
const {getTodo, createTodo, getById}=require("../controllers/todoController");
const authMiddleware=require("../middleware/authmiddleware");

router.post("/get",authMiddleware, getTodo);
router.post("/create", authMiddleware,createTodo);
router.get("/get/:id", getById);

module.exports=router;

