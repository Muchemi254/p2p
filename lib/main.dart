import 'package:flutter/material.dart';


void main(){
  runApp(
    const MaterialApp(home: WelcomeScreen()
    ),
     );
}


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black, Colors.orange],
            stops: [0.0, 10.0], // Optional: define stops for the gradient colors
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //logo
            const FlutterLogo(size: 150,),
            const SizedBox(height: 20,),


            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0), // Margin around the entire container
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0), // Padding inside the Text widget
                child:  Text('Welcome to\n the world of LOOP!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ),

            const SizedBox( height: 15,),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0), // Margin around the entire container
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0), // Padding inside the Text widget
                child: Text(
                  'Please enter 33 your phone number\n to proceed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),




            const SizedBox( height: 25,),

            Container(
              padding: const EdgeInsets.all(5.0), // Padding around the child widget
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color of the container
                borderRadius: BorderRadius.circular(10.0), // Border radius all around
              ),
              child: //Buttons
              Row(children: <Widget>[
                Expanded(child: ElevatedButton(
                  onPressed:(){},// button logic
                  child: const Text ('Mobile Phone'),
                ),),
                Expanded(child: ElevatedButton(
                  onPressed:(){},// button logic
                  child: const Text ('Email'),
                ),),
              ],),
            ),








            const SizedBox( height: 20,),

 Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color of the container
                borderRadius: BorderRadius.circular(10.0), // Border radius all around
              ),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Kenya ',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: const Text(''),
        
                  ),
                ),
              ],
            ),
            ),

   
 const SizedBox( height: 20,),

 Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color of the container
                borderRadius: BorderRadius.circular(10.0), // Border radius all around
              ),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '+254 ',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter your phone number',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder( // Create a plain box border
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white), // Optional border color
                      ),
                      enabledBorder: InputBorder.none, // Remove the default underline
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            ),

const SizedBox(height: 20,),

 Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color of the container
                borderRadius: BorderRadius.circular(10.0), // Border radius all around
              ),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '   Enter your email address',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder( // Create a plain box border
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white), // Optional border color
                      ),
                      enabledBorder: InputBorder.none, // Remove the default underline
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            ),

            const SizedBox(height: 20,),

            //Buttons
            Row(children: <Widget>[
              Expanded(child: ElevatedButton(
                onPressed:(){},// button logic
                child: const Text ('sign in'),
              ),),
            ],),

            const SizedBox(height: 20,),

            //Buttons
            Row(children: <Widget>[
              Expanded(child: ElevatedButton(
                onPressed:(){},// button logic
                child: const Text ('Create an account'),
              ),),
            ],),

          ],
        ),
      ),
    );
  }
}

