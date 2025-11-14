// Business Logic
// Contains functions that handle logic like fetching, creating,  
// updating data. These are called by the routes.
const Recipe = require('../models/Recipe');

// GET /recipes
// Fetch all recipes from the database
exports.getAllRecipes = async (req, res) => {
    try {
        const recipes = await Recipe.find();
        res.json(recipes);
    } catch (error) {
        console.error('Error fetching recipes: ', error);
        res.status(500).json({message: 'Server error while fetching recipes'});
    }
};

// POST /recipes
// Create a new recipe and save it to the database
exports.createRecipe = async (req , res) => {
    try{
        const { title, ingredients, instructions } = req.body;

        // Basic validation 
        if (!title || !ingredients) {
            return res.status(400).json({ message: 'Title and ingredients are required.'});
        }
        const newRecipe = new Recipe ({
            title, 
            ingredients,
            instructions,
        });
        const savedRecipe = await newRecipe.save();
        res.status(201).json(savedRecipe);
    } catch(error) {
        console.error('Error creating recipe: ', error);
        res.status(500).json({message: 'Server error while creating recipe.'});
    }
}

// PUT /recipes/:id update a recipe by ID
exports.updateRecipe = async (req, res) => {
    try {
        const { id } = req.params;
        const updatedRecipe = await Recipe.findByIdAndUpdate(id, req.body, {new: true});
        if (!updatedRecipe) {
            return res.status(404).json({ message: 'Recipe not found'});
        }
        res.json(updatedRecipe);
    } catch (error) {
        res.status(500).json({ message: 'Error updating recipe'});
    }
};

// DELETE /recipes/:id delete a recipe by ID
exports.deleteRecipe = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedRecipe = await Recipe.findByIdAndDelete(id);
        if (!deletedRecipe) {
            return res.status(404).json({ message: 'Recipe not found.'});
        }
        res.json({message: 'Recipe deleted successfully'});
    } catch (error) {
        res.status(500).json({message: 'Error deleting recipe.'});
    }
};