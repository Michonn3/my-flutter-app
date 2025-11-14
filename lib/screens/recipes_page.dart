import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _recipes = [];

  final _titleController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addRecipe() {
    if (_formKey.currentState!.validate()) {
      final newRecipe = {
        'title': _titleController.text.trim(),
        'ingredients': _ingredientsController.text.trim(),
        'instructions': _instructionsController.text.trim(),
        'image': _image,
      };

      setState(() {
        _recipes.add(newRecipe);
        _titleController.clear();
        _ingredientsController.clear();
        _instructionsController.clear();
        _image = null;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Recipe added!')));
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Recipes')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Recipe Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Recipe Title',
                    ),
                    validator:
                        (value) => value!.isEmpty ? 'Enter a title' : null,
                  ),
                  TextFormField(
                    controller: _instructionsController,
                    decoration: const InputDecoration(
                      labelText: 'Instructions',
                    ),
                    maxLines: 5,
                    validator:
                        (value) => value!.isEmpty ? 'Enter instructions' : null,
                  ),
                  const SizedBox(height: 10),
                  _image != null
                      ? Image.file(_image!, height: 100)
                      : const Text('No image selected.'),
                  TextButton.icon(
                    icon: const Icon(Icons.photo),
                    onPressed: () async {
                      await _pickImage();
                    },
                    label: const Text('Upload Image'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _addRecipe,
                    child: const Text('Save Recipe'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text('Saved Recipes', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            // Display Recipes
            ..._recipes.map((recipe) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading:
                      recipe['image'] != null
                          ? Image.file(
                            recipe['image'],
                            width: 50,
                            fit: BoxFit.cover,
                          )
                          : const Icon(Icons.food_bank),
                  title: Text(recipe['title']),
                  subtitle: Text(recipe['ingredients']),
                  onTap: () => _showRecipeDetails(recipe),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _showRecipeDetails(Map<String, dynamic> recipe) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(recipe['title']),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (recipe['image'] != null)
                    Image.file(recipe['image'], height: 150),
                  const SizedBox(height: 10),
                  Text('Ingredients:\n${recipe['ingredients']}\n'),
                  Text('Instructions:\n${recipe['instructions']}'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }
}
