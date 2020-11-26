import 'dart:ui';

import 'package:flutter/material.dart';

import 'component/rounded_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1(),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: double.infinity,
          color: Color(0Xff283363),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Excited?!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(height: 20),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'You should be!!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(height: 20),
                Container(height: 20),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Sign In if you already have an account with us',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(height: 10),
                RoundedButton(
                  color: Colors.white,
                  text: 'Sign In',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Screen2();
                        },
                      ),
                    );
                  },
                ),
                Container(height: 20),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Or sign up if you are new!',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(height: 10),
                RoundedButton(
                  color: Colors.white,
                  text: 'Sign Up',
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void validateInput() {
    FormState form = this.fromKey.currentState;
    ScaffoldState scaffold = this.scaffoldKey.currentState;

    SnackBar message = SnackBar(content: Text('Login Berhasil!!'));

    if (form.validate()) {
      scaffold.showSnackBar(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            height: size.height,
            width: double.infinity,
            color: Color(0Xff283363),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/rohizh.jpg",),
                          ),
                      ),
                      ),
                    Container(height: 20),
                    Container(height: 20),
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(height: 20),
                    Container(height: 20),
                    Form(
                      key: fromKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: new InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(40.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              hintText: "Email Address",
                              fillColor: Colors.white,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Insert Email';
                              }
                            },
                          ),
                          Container(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: new InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(40.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              hintText: "Password",
                              fillColor: Colors.white,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Insert Password';
                              }
                            },
                          ),
                          Container(
                            height: 20,
                          ),
                          RoundedButton(
                            color: Color(0xff00818b),
                            text: 'LOGIN',
                            textColor: Colors.white,
                            press: validateInput,
                          ),
                        ],
                      ),
                    ),
                    Container(height: 20),
                    Text(
                      'Forgot password?',
                      style: TextStyle(color: Color(0xff00818b)),
                    ),
                    Container(height: 20),
                    Container(height: 20),
                    Text(
                      'Register Here',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
