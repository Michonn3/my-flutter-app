import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../utils/pdf_handler.dart';

InputDecoration buildInputDecoration(String label, String hint) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    // prefixIcon: Icon(Icons.leadingIcon),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    errorBorder: OutlineInputBorder(),
    contentPadding: EdgeInsets.all(12),
  );
}

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //final TextEditingController _dobController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Do somethiing with the input data
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');

      String userName = _nameController.text;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Profile created!')));

      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(userName: userName),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Your Profile')),

      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: buildInputDecoration('Name *', 'John Doe'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                controller: _emailController,
                decoration: buildInputDecoration(
                  'Email *',
                  'yourEmail@gmail.com',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                obscureText: _obscurePassword,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8) {
                    return 'Must be at least 8 characters';
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Must contain at least one uppercase letter';
                  }
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Must contain at least one lowercase letter';
                  }
                  if (!RegExp(r'\d').hasMatch(value)) {
                    return 'Must contain at least one number';
                  }
                  if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                    return 'Must contain at least one special character (!@#\$&*~)';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      bool isValid = _formKey.currentState!.validate();
                      if (isValid) {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      }

                      // Navigate to PDF upload page (or dashboard)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FilePickerHomePage(),
                        ),
                      );
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              SizedBox(height: 24),

              ElevatedButton(onPressed: _submitForm, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
