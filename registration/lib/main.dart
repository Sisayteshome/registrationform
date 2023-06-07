import 'package:flutter/material.dart';
import 'package:registration/registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registration Form'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: RegistrationForm(),
        ),
      ),
    );
  }
}
