/*
     Define the actual URL endpoints for recipes and tells Express which
     controller function to run. Defines the URL structure and HTTP methods. 
     Delegates logic to controllers.
*/

const express = require('express');
const router = express.Router();

// Import the controller that contains the logic
const recipeController = require('../controllers/recipeController');

// GET /recipes. Fetch all recipes
router.get('/', recipeController.getAllRecipes);

// POST /recipes. Create a new recipe
router.post('/', recipeController.createRecipe);

// PUT /:id Update a recipe
router.put('/:id', recipeController.updateRecipe);

// Delete a recipe
router.delete('/:id', recipeController.deleteRecipe);

// Export the router to use in server.js
module.exports = router;