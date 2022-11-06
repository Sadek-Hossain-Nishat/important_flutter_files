import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'flutterfirebaseauthentication.dart';
import 'userhomepage.dart';

class Firebaselogin extends StatelessWidget {
  const Firebaselogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforlogin(),
    );
  }
}

class Homepageforlogin extends StatefulWidget {
  const Homepageforlogin({Key? key}) : super(key: key);

  @override
  State<Homepageforlogin> createState() => _HomepageforloginState();
}

class _HomepageforloginState extends State<Homepageforlogin> {
  var _passwordvisibility = false;
  var userEmail = TextEditingController();
  var userPassword = TextEditingController();
  var _loginFormKey = GlobalKey<FormState>();

  login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail.text.toString(),
          password: userPassword.text.toString());

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Userpage()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userEmail.dispose();
    userPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
            child: Form(
                key: _loginFormKey,
                child: Center(
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: userEmail,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field must be required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'User Email',
                            hintText: 'Enter your email'),
                      ),
                      TextFormField(
                        controller: userPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field must be required';
                          } else {
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            } else {
                              return null;
                            }
                          }
                        },
                        obscureText: _passwordvisibility ? false : true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordvisibility = !_passwordvisibility;
                                  });
                                },
                                icon: Icon(_passwordvisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            labelText: 'User Password',
                            hintText: 'Enter your password'),
                      ),
                      ElevatedButton(
                          onPressed: () => {
                                if (_loginFormKey.currentState!.validate())
                                  {login()}
                              },
                          child: Text('Log in')),
                      SizedBox(
                        height: 50,
                      ),
                      Text('Not Registered'),
                      ElevatedButton(
                          onPressed: () => {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FlutterAuthwithFirebase()))
                              },
                          child: Text('Register'))
                    ],
                  ),
                ))),
      ),
    ));
  }
}
