import 'package:flutter/material.dart';

import 'create_account.dart';

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
  final FocusNode _emailFocusNode = FocusNode(); // For the email TextField
  bool _isEmailFocused = false;
  Color myOrange = const Color(0xFFFB5D00);
  Color mygreytxt = const Color(0xFFD8D8D8);
  Color mygreyBg = const Color(0xFFC0C0C0);

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() { // Listener for email TextField
      setState(() {
        _isEmailFocused = _emailFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose(); // Dispose email focus node
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFFDFDFD),
            child: Column(
              children: [
                // Stack for Image and Overlaying Text and Icon
                const SizedBox(height: 60,),
                Stack(
                  children: [



                    // Image
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/login.jpg', // Your image path
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // Overlaying Text and Back Icon
                    Positioned(
                      left: 16,
                      top: 20, // Adjust as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.black),
                            onPressed: () {
                              // Back button functionality
                            },
                          ),
                          const SizedBox(height: 70,),
                          const Text(
                            'Hi, BRIAN',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 30,),
                          const Text(
                            'Welcome back!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF404040),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Content Below Image
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 65,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: _isEmailFocused ? Colors.black : mygreytxt, // Conditional border color
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  obscureText: _obscureText,
                                  style: const TextStyle(
                                      fontSize: 24
                                  ),
                                  focusNode: _emailFocusNode, // Assign the focus node
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: myOrange,
                                  decoration: InputDecoration(

                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                    hintText: 'Enter password',
                                    hintStyle: TextStyle(color: mygreytxt,
                                        fontSize: 24),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  color: Colors.transparent,
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Text(
                      'Forgot password',
                      style: TextStyle(fontSize: 20,
                          color: myOrange),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // Sign In Button
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    height: 70,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PasswdPage()),
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStateProperty.all<Color>(mygreyBg), // Correct way to set background color
                                        elevation: WidgetStateProperty.all<double>(0), // Remove elevation
                                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                                      ),// button logic
                                      child: const Text('sign In',
                                        style: TextStyle(
                                            fontSize: 24
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    height: 70,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const CreateAccountPage()),
                                        );
                                      }, // button logic
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStateProperty.all<Color>(Colors.white), // White background
                                        elevation: WidgetStateProperty.all<double>(0), // Remove elevation
                                        foregroundColor: WidgetStateProperty.all<Color>(myOrange), // Orange text
                                        side: WidgetStateProperty.all<BorderSide>(
                                          BorderSide(color: myOrange), // Orange border
                                        ),
                                      ),
                                      child: const Text('Switch account',
                                        style: TextStyle(
                                            fontSize: 24
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
