import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? nameError;
  String? emailError;
  String? passwordError;

  void validateAndSignUp() {
    setState(() {
      // Reset error messages
      nameError = null;
      emailError = null;
      passwordError = null;

      // Validate name
      if (nameController.text.trim().isEmpty) {
        nameError = "This field is required";
      }
      // Validate email
      if (emailController.text.trim().isEmpty) {
        emailError = "This field is required";
      }
      // Validate password
      if (passwordController.text.trim().isEmpty) {
        passwordError = "This field is required";
      }

      // If all fields are valid
      if (nameError == null && emailError == null && passwordError == null) {
        // ignore: avoid_print
        print("Name: ${nameController.text}");
        // ignore: avoid_print
        print("Email: ${emailController.text}");
        // ignore: avoid_print
        print("Password: ${passwordController.text}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns all children to the left
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Adds spacing between elements
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name", // Placeholder for name
                border: const OutlineInputBorder(),
                errorText: nameError, // Error message
              ),
            ),
            const SizedBox(height: 20), // Adds spacing between text fields
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email", // Placeholder for email
                border: const OutlineInputBorder(),
                errorText: emailError, // Error message
              ),
            ),
            const SizedBox(height: 20), // Adds spacing between text fields
            TextField(
              controller: passwordController,
              obscureText: true, // Hides password input
              decoration: InputDecoration(
                labelText: "Password", // Placeholder for password
                border: const OutlineInputBorder(),
                errorText: passwordError, // Error message
              ),
            ),
            const SizedBox(height: 20), // Adds spacing above the next elements
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(), // Keeps alignment correct
                TextButton(
                  onPressed: () {
                    // Handle navigation to login screen
                    // ignore: avoid_print
                    print("Navigate to login screen");
                  },
                  child: const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: validateAndSignUp,
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
