import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {

  final FocusNode _phoneFocusNode = FocusNode(); // For the phone number TextField // For the phone number TextField
  bool _isPhoneFocused = false;


  @override
  void initState() {
    super.initState();
    _phoneFocusNode.addListener(() { // Listener for phone number TextField
      setState(() {
        _isPhoneFocused = _phoneFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose(); // Dispose phone number focus node
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    Color myOrange = const Color(0xFFFB5D00);
    Color mygreytxt = const Color(0xFFD8D8D8);
    Color mygreyBg = const Color(0xFFC0C0C0);


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Enter Phone Number',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        ),
        flexibleSpace: Image.asset(
          'assets/images/top_bg.png', // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'LOOP will need your phone number to\n verify your account',
                style: TextStyle(fontSize: 26,
                  color: Color(0xFF3F4043)

                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              //phone textbox
              Container(

                child: Column(
                  children: [
                    // container kenya country
                    Container(
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

              SizedBox(height: 20,),



              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 65,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(myOrange), // Correct way to set background color
                          elevation: WidgetStateProperty.all<double>(0), // Remove elevation
                          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                        ),// button logic
                        child: const Text('Next',
                          style: TextStyle(
                              fontSize: 24
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(), // Push the paragraph to the bottom
              const Padding(
                padding: EdgeInsets.only(bottom: 60.0, right: 20, left: 20),
                child: Text(
                  '''By clicking "Next", you can confirm that you are out authorized to use the phone number enetred and agree to recieve SMS texts veryfing your identity and as otherwise permitted by LOOP's terms & conditions and data privacy policy,''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}