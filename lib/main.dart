import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/services.dart';
import 'package:p2p/create_account.dart';
import 'package:p2p/passwd_page.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set status bar to transparent
    statusBarIconBrightness: Brightness.dark, // Set status bar icons to dark (optional)
  ));
  runApp(
    const MaterialApp(
      home: WelcomeScreen(
      ),
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
  final FocusNode _emailFocusNode = FocusNode(); // For the email TextField
  final FocusNode _phoneFocusNode = FocusNode(); // For the phone number TextField // For the phone number TextField
  bool _isEmailFocused = false;
  bool _isPhoneFocused = false;


  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() { // Listener for email TextField
      setState(() {
        _isEmailFocused = _emailFocusNode.hasFocus;
      });
    });
    _phoneFocusNode.addListener(() { // Listener for phone number TextField
      setState(() {
        _isPhoneFocused = _phoneFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    // ... dispose other controllers
    _emailFocusNode.dispose(); // Dispose email focus node
    _phoneFocusNode.dispose(); // Dispose phone number focus node
    super.dispose();
  }


// ... (rest of your code)

  @override
  Widget build(BuildContext context) {
    Color myOrange = const Color(0xFFFB5D00);
    Color mygreytxt = const Color(0xFFD8D8D8);
    Color mygreyBg = const Color(0xFFC0C0C0);
    return Scaffold(
      // ... (rest of your Scaffold code)
      resizeToAvoidBottomInset: true,

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
                  // ... (rest of your body container code)
            color: Color(0xFFFDFDFD),
                  padding: const EdgeInsets.only(right: 30, left: 30,),


          child: Column(
            // ... (rest of your Column code)
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  const Image(
                    image: AssetImage('assets/images/login.jpg'),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                      height: 250, // Set yourdesired fixed height here
                      child: Column(
                        children: [
                          //container 2 buttons email and ohobe
                          Container(
                            padding: const EdgeInsets.all(5.50), // Padding around the container
                            decoration: BoxDecoration(
                              color: mygreytxt,
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: const Size.fromHeight(55),
                                      backgroundColor: showPhoneForm ? myOrange : mygreytxt,
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        showPhoneForm = true;
                                      });
                                    },
                                    child: Text(
                                      "Mobile Phone",
                                      style: TextStyle(
                                        fontSize:24,
                                        color: showPhoneForm ? Colors.white : Colors.black,),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8), // Space between buttons
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: const Size.fromHeight(55),
                                      backgroundColor: !showPhoneForm ? myOrange : mygreytxt,
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        showPhoneForm = false;
                                      });
                                    },
                                    child: Text("Email",
                                      style: TextStyle(
                                        fontSize: 24,
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
                                  // container kenya country
                                  Container(
                                    decoration:BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: mygreytxt,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: const SizedBox(
                                      height: 65,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Kenya',style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 24
                                            ),
                                            ),
                                          ),
                                          // Create the Icon widget outside the const context
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0),
                                            child: Icon(MaterialIcons.expand_more,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  // container phone number
                                  SizedBox(
                                    height: 65,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15.0),
                                        border: Border.all(
                                          color: _isPhoneFocused ? Colors.black : mygreytxt, // Conditional border color
                                          width: 1.0,
                                        ),
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
                                                fontSize: 24,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              width: 200,
                                              child: TextField(
                                                style: TextStyle(
                                                    fontSize: 24
                                                ),
                                                focusNode: _phoneFocusNode, // Assign the focus node
                                                controller: phoneController,
                                                keyboardType: TextInputType.phone,
                                                cursorColor: myOrange,
                                                decoration: InputDecoration(
                                                  hintText: 'Enter your phone number',
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !showPhoneForm,
                            child: Container(

                              child: Column(
                                children: [
                                  // container email number
                                  SizedBox(
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
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: 200,
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 24
                                                  ),
                                                  focusNode: _emailFocusNode, // Assign the focus node
                                                  controller: emailController,
                                                  keyboardType: TextInputType.emailAddress,
                                                  cursorColor: myOrange,
                                                  decoration: InputDecoration(
                                                    hintText: 'Enter your email address',
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
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )

                  ),
                ],
              ),
              // Login Form

              const SizedBox(height: 10), // Space after login form//Button
              //Buttons
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
                              child: const Text('Create an account',
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
          )
              ),
        ),
      ),
    );
  }
}