/*
    Entry point of the backend app. It creates the
    Express app, connects to MongoDB, and sets up routing.


*/
require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const Recipe = require('./models/Recipe');
const recipeRoutes = require('./routes/recipeRoutes');
const app = express();
const mongoUri = process.env.MONGO_URI || 'mongodb://localhost:27017/recipes';
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());
app.use('/recipes', recipeRoutes);


mongoose.connect(mongoUri)
.then(() => console.log("MongoDB connected"))
.catch(err => console.error("MongoDB connection error: ", err));


// Routes
app.get('/recipes', async (req, res) => {
    const recipes = await Recipe.find();
    res.json(recipes);
});

app.post('/recipes', async (req, res) => {
    const recipe = new Recipe(req.body);
    await recipe.save();
    res.status(201).json(recipe);
});

app.listen(5000, () => console.log('Server running on port 5000'));