// models/Subtask.js
const mongoose = require("mongoose");

const SubtaskSchema = new mongoose.Schema({
    title: { type: String, required: true },
    completed: { type: Boolean, default: false },
    task: { type: mongoose.Schema.Types.ObjectId, ref: "Task" }
});

module.exports = mongoose.model("Subtask", SubtaskSchema);
