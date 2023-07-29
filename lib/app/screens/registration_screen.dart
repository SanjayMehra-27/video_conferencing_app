import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/authentication_service.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthenticationService _authService = AuthenticationService();

  void _register() async {
    final String? email = _emailController.text.trim();
    final String? password = _passwordController.text.trim();
    if (email != null && password != null) {
      String? userId = await _authService.registerUser(email, password);
      if (userId != null) {
        // Registration successful, navigate to another screen or do something
        print('User registered successfully. UserID: $userId');
      } else {
        // Registration failed, show error message
        Get.snackbar('Error', 'Failed to register. Please try again.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
