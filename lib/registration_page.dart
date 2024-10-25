import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/registration_controller.dart';
import 'home_screen.dart';

class RegistrationPage extends StatelessWidget {
  final RegistrationController _controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrasi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                _controller.email.value = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) {
                _controller.password.value = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _controller.register();
                if (_controller.email.isNotEmpty) {
                  // Navigate to HomeScreen after successful registration
                  Get.to(() => HomeScreen());
                }
              },
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
