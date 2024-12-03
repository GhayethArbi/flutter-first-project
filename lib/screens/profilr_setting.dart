import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatefulWidget {
  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? currentPasswordError;
  String? newPasswordError;
  String? addressError;

  void validateAndSave() {
    setState(() {
      // Reset error messages
      currentPasswordError = null;
      newPasswordError = null;
      addressError = null;

      // Validate current password
      if (currentPasswordController.text.trim().isEmpty) {
        currentPasswordError = "Current password cannot be empty";
      }

      // Validate new password
      if (newPasswordController.text.trim().isEmpty) {
        newPasswordError = "New password cannot be empty";
      }

      // Validate address
      if (addressController.text.trim().isEmpty) {
        addressError = "Address cannot be empty";
      }

      // If all fields are valid, perform save logic
      if (currentPasswordError == null &&
          newPasswordError == null &&
          addressError == null) {
        print("Saved successfully!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50], // Light pink background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile avatar
              Image.asset(
                'assets/profil.png', // Ensure this matches your image file path
                height: 120,
              ),
              const SizedBox(height: 16),

              // Title
              const Text(
                "Profile settings",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Current Password TextField
              TextField(
                controller: currentPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Current password",
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  errorText: currentPasswordError, // Error for current password
                ),
              ),
              const SizedBox(height: 16),

              // New Password TextField
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "New password",
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  errorText: newPasswordError, // Error for new password
                ),
              ),
              const SizedBox(height: 16),

              // Address TextField
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  errorText: addressError, // Error for address
                ),
              ),
              const SizedBox(height: 20),

              // Save Button
              ElevatedButton(
                onPressed: validateAndSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "SAVE",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileSettingsScreen(),
  ));
}
