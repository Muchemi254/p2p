import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WelcomeScreen(),
    ),
  );
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showPhoneForm = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    super.dispose();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (rest of your Scaffold code)
      body: Container(
        // ... (rest of your body container code)
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
            color: Colors.black
        ),
        child: Column(
          // ... (rest of your Column code)
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ... (other widgets)
            //logo
            //const FlutterLogo(size: 150,),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Welcome to\n the world of LOOP!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: Text(
                  'Please enter your phone number\n to proceed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Login Form
            Container(
              padding: const EdgeInsets.all(8.0), // Padding around the container
              decoration: BoxDecoration(
                color: Colors.grey[200],borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: showPhoneForm ? Colors.orange : Colors.grey[200],
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        setState(() {
                          showPhoneForm = true;
                        });
                      },
                      child: const Text(
                        "Phone",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Space between buttons
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !showPhoneForm ? Colors.orange : Colors.grey[200],
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        setState(() {
                          showPhoneForm = false;
                        });
                      },
                      child: const Text("Email",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}