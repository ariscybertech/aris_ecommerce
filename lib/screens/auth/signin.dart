import 'package:ecommerce/screens/auth/forgot.dart';
import 'package:ecommerce/screens/auth/signup.dart';
import 'package:ecommerce/styles/defauls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailNode.addListener(() {
      setState(() {});
    });
    passwordNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: defaulColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * top section h * 0.33
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: height * .05,
                left: width * .1,
              ),
              child: Text(
                "Welcome\nback",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.08,
                ),
              ),
            ),
            // * bottom section h * 0.65
            Container(
              height: height * .7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(
                40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* login text
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                  //* email input field

                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:
                              height * 0.06, // * 6 percent of the device height
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            focusNode: emailNode,
                            decoration: InputDecoration(
                              fillColor: defaulColor,
                              focusColor: defaulColor,
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: (emailNode.hasFocus)
                                    ? defaulColor
                                    : Colors.grey,
                              ),
                              icon: Icon(
                                Icons.email_rounded,
                                color: (emailNode.hasFocus)
                                    ? defaulColor
                                    : Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //* password input field with show button

                        Container(
                          height: height * 0.06,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            focusNode: passwordNode,
                            obscureText: _hidePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hidePassword = !_hidePassword;
                                  });
                                },
                                icon: (!_hidePassword)
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: (passwordNode.hasFocus)
                                            ? defaulColor
                                            : Colors.grey,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: (passwordNode.hasFocus)
                                            ? defaulColor
                                            : Colors.grey,
                                      ),
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: (passwordNode.hasFocus)
                                    ? defaulColor
                                    : Colors.grey,
                              ),
                              icon: Icon(
                                Icons.lock,
                                color: (passwordNode.hasFocus)
                                    ? defaulColor
                                    : Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        //* forgot password

                        GestureDetector(
                          onTap: () {
                            print("Tapped on forgot password?");
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (ctx) => ForgotScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: defaulColor,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //* login button

                  Container(
                    height: height * .07,
                    width: width * .8,
                    decoration: BoxDecoration(
                      color: defaulColor,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.03,
                        ),
                      ),
                    ),
                  ),

                  //* create account button
                  GestureDetector(
                    onTap: () {
                      print("Tapped on create account");
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) => SignUp(),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: defaulColor,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
