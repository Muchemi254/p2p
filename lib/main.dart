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
    super.dispose();
  }

// ... (rest of your code)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (rest of your Scaffold code)
      body:
      Container(
      // ... (rest of your body container code)
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        // ... (rest of your Column code)
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         /* Expanded( // Wrap the top part in Expanded
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        fontSize: 30,fontWeight: FontWeight.bold,
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
              ],
            ),
          ), */
          // Login Form
          Container(
            padding: const EdgeInsets.all(4.0), // Padding around the container
            decoration: BoxDecoration(
              color: Colors.grey[300],borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: showPhoneForm ? Colors.orange : Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      setState(() {
                        showPhoneForm = true;
                      });
                    },
                    child: Text(
                      "Mobile Phone",
                      style: TextStyle(color: showPhoneForm ? Colors.white : Colors.black,),
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Space between buttons
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: !showPhoneForm ? Colors.orange : Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      setState(() {
                        showPhoneForm = false;
                      });
                    },
                    child: Text("Email",
                      style: TextStyle(
                        color: !showPhoneForm ? Colors.white : Colors.black,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10), // Space after login form
          Visibility(
            visible: showPhoneForm,
            child: Container(

              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '+254 ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 200,
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: 'Enter your phone number',
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(color: Colors.white),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '+254 ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 200,
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: 'Enter your phone number',
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(color: Colors.white),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !showPhoneForm,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 200,
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: '   Enter your email address',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20), // Space after login form//Buttons
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {}, // button logic
                  child: const Text('Sign In'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          //Buttons
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {}, // button logic
                  child: const Text('Create an account'),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}