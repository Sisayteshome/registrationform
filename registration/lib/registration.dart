import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';
  String _retypePassword = '';

  void _createUser() {
    if (_formKey.currentState!.validate()) {
      // Perform the registration logic here
      // You can send the registration details to an API or store them locally
      // Replace the print statements with your desired implementation

      print('First Name: $_firstName');
      print('Last Name: $_lastName');
      print('Email: $_email');
      print('Password: $_password');
      print('Retype Password: $_retypePassword');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'First Name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
            onChanged: (value) {
              _firstName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Last Name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
            onChanged: (value) {
              _lastName = value;
            },
          ),

          // ...

          // ...

TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains(RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'))) {
                    return 'Invalid email format';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),

          TextFormField(
  decoration: InputDecoration(labelText: 'Password'),
  obscureText: true,
  controller: _passwordController,
  validator: (value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  },
  onChanged: (value) {
    _password = value;
  },
),

// ...
          TextFormField(
            decoration: InputDecoration(labelText: 'Retype Password'),
            obscureText: true,
            controller: _retypePasswordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please retype your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            onChanged: (value) {
              _retypePassword = value;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _createUser,
            child: Text('Create User'),
          ),
        ],
      ),
    );
  }
}
