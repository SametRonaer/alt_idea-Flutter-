import 'package:alt_idea/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final String signUpText =
      "Create a profile as a student or a person who wants to enter to this world of ideas.";
  final String signInText =
      "Collaboration has never been easier! Build an idea or join an idea team..";
  bool _isSignUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, right: 30, left: 30),
                        child: Image.asset(
                            "assets/images/alt_idea_logo_white.png"),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _isSignUp ? "Create an Account" : "Welcome Back!",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "AcuminPro",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _isSignUp ? signUpText : signInText,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: "AcuminPro",
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              padding: EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                child: Image.asset("assets/images/triangle.png"),
                // height: 35,
                // width: 35,
              ),
            ),
            AuthForm(switchAuthScreenFormat),
            Container(
              height: 50,
              padding: EdgeInsets.all(0),
              width: double.infinity,
              color: Colors.black,
              child: TextButton(
                child: Text(
                  "What is alt_idea?",
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                onPressed: () {
                  print("What is alt_idea?");
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void switchAuthScreenFormat(bool value) {
    setState(() {
      _isSignUp = value;
    });
  }
}
