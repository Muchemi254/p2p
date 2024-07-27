import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PasswdPage(),
    );
  }
}

class PasswdPage extends StatefulWidget {
  @override
  _PasswdPageState createState() => _PasswdPageState();
}

class _PasswdPageState extends State<PasswdPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Stack for Image and Overlaying Text and Icon
                SizedBox(height: 60,),
                Stack(
                  children: [



                    // Image
                    Container(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/login.jpg', // Your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Overlaying Text and Back Icon
                    Positioned(
                      left: 16,
                      top: 100, // Adjust as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.black),
                            onPressed: () {
                              // Back button functionality
                            },
                          ),
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Content Below Image
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      // Password Text Field
                      Container(
                        width: double.infinity,
                        child: TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Enter Password',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Sign In Button
                      ElevatedButton(
                        onPressed: () {
                          // Sign In functionality
                        },
                        child: Text('Sign In'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50), // Full width button
                        ),
                      ),
                      SizedBox(height: 10),
                      // Switch Account Button
                      ElevatedButton(
                        onPressed: () {
                          // Switch Account functionality
                        },
                        child: Text('Switch Account'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50), // Full width button
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
