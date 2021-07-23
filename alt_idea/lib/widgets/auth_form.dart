import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
  final Function switchAuthScreen;

  AuthForm(this.switchAuthScreen);
}

class _AuthFormState extends State<AuthForm> {
  double _sizedBoxHeight;
  bool _isSignUp = false;
  double _deviceHeight;
  double _deviceWidth;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _sizedBoxHeight = _deviceHeight / 40;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: _deviceWidth / 20),
      child: Padding(
        padding: EdgeInsets.all(_deviceHeight / 55),
        child: Form(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: Text("Sign In",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        )),
                    onPressed: () {
                      setState(() {
                        _isSignUp = false;
                        widget.switchAuthScreen(false);
                      });
                    },
                  ),
                  TextButton(
                    child: Text("Sign Up",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        )),
                    onPressed: () {
                      setState(() {
                        _isSignUp = true;
                        widget.switchAuthScreen(true);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: _sizedBoxHeight,
              ),
              if (_isSignUp) getTextFormField("Full Name", false),
              SizedBox(height: _sizedBoxHeight),
              getTextFormField("Mail", false),
              SizedBox(height: _sizedBoxHeight),
              getTextFormField("Password", true),
              SizedBox(height: _sizedBoxHeight),
              if (!_isSignUp)
                Row(
                  children: [
                    SizedBox(width: _deviceWidth / 2.1),
                    TextButton(
                        child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.6,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    )),
                  ],
                ),
              if (_isSignUp) getTextFormField("Confirm Password", true),
              SizedBox(height: _deviceHeight / 58.57),
              if (_isSignUp)
                Text(
                  "By clicking sign up you are agreeing our Terms and that you have read Our Data Policy including our Cookie Use.",
                  style: TextStyle(fontSize: 10),
                ),
              SizedBox(
                  height: _isSignUp ? _deviceHeight / 40 : _deviceHeight / 20),
              ElevatedButton(
                child: Text(
                  _isSignUp ? "SIGN UP" : "SIGN IN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(_deviceWidth / 2, _deviceHeight / 17),
                    primary: Colors.white,
                    enableFeedback: true,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(25),
                    )),
              ),
              if (!_isSignUp) SizedBox(height: _deviceHeight / 16.4),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField getTextFormField(String text, bool hideText) {
    return TextFormField(
      key: ValueKey(text),
      obscureText: hideText,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
