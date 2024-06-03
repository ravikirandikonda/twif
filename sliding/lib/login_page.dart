import 'package:flutter/material.dart';

import 'color_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // Add padding only at the bottom
              child: SizedBox(
                height: 120, // Increase the height of the SizedBox
                width: 150, // Increase the width of the SizedBox
                child: Image.asset(
                  'assets/logobg.png', // Assuming you have a logo asset
                  fit: BoxFit.contain, // Ensure the image fits within the specified dimensions
                ),
              ),
            ),
            buildTextFormField('Email or Username'),
            SizedBox(height: 20), // Increased space
            buildPasswordTextFormField('Password'),
            SizedBox(height: 30), // Increased space
            Container(
              height: 50, // 1cm converted to pixels
              width: double.infinity, // Set width to full width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Rounded edges
                color: Color.fromARGB(255, 255, 230, 3), // Set background color to yellow
              ),
              child: ElevatedButton(
                onPressed: () {
                  // If login is successful, navigate to the main screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ColorScreen(),
                    ),
                  );
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 230, 3), // Match the container's color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded edges
                  ),
                  elevation: 0, // No elevation
                  shadowColor: Colors.transparent, // No shadow
                  padding: EdgeInsets.zero, // Remove internal padding
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(String labelText) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey), // Set label color to grey
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Set underline color to grey
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue), // Set focused underline color to blue
        ),
      ),
    );
  }

  Widget buildPasswordTextFormField(String labelText) {
    return TextFormField(
      obscureText: !_isPasswordVisible, // Toggle visibility based on state
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey), // Set label color to grey
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Set underline color to grey
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue), // Set focused underline color to blue
        ),
        suffixIcon: IconButton(
          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off), // Use an eye icon
          onPressed: () {
            // Toggle the obscureText state
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    );
  }
}
