import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebaselogin.dart';
import 'userhomepage.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlutterAuthwithFirebase());
}

class FlutterAuthwithFirebase extends StatelessWidget {
  const FlutterAuthwithFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforauth(),
    );
  }
}

class Homepageforauth extends StatefulWidget {
  const Homepageforauth({Key? key}) : super(key: key);

  @override
  State<Homepageforauth> createState() => _HomepageforauthState();
}

class _HomepageforauthState extends State<Homepageforauth> {
  var _formkey = GlobalKey<FormState>();
  var _passwordvisibility = false;
  var _retypepasswordvisibility = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final retypepasswordcontroller = TextEditingController();
  bool userExist = false;

  register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailcontroller.text.toString(),
              password: passwordcontroller.text.toString());

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Firebaselogin()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailcontroller.dispose();
    passwordcontroller.dispose();
    retypepasswordcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Hello init method');
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        setState(() {
          userExist = false;
        });
      } else {
        print('User is signed in!');
        setState(() {
          userExist = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return userExist
        ? Userpage()
        : SafeArea(
            child: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Firebase Auth'),
              centerTitle: true,
            ),
            body: Form(
                key: _formkey,
                child: SingleChildScrollView(
                    child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Registration',
                        style: TextStyle(
                            fontSize: 30, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field must be required';
                            }

                            return null;
                          },
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'User Email',
                              hintText: 'Enter your mail',
                              prefixIcon: Icon(Icons.email))),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
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
                          controller: passwordcontroller,
                          obscureText: _passwordvisibility ? false : true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              prefixIcon: Icon(Icons.key),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordvisibility =
                                          !_passwordvisibility;
                                    });
                                  },
                                  icon: Icon(_passwordvisibility
                                      ? Icons.visibility
                                      : Icons.visibility_off)))),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
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
                          controller: retypepasswordcontroller,
                          obscureText: _retypepasswordvisibility ? false : true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                              labelText: 'Retype Password',
                              hintText: 'Retype your password',
                              prefixIcon: Icon(Icons.key),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _retypepasswordvisibility =
                                          !_retypepasswordvisibility;
                                    });
                                  },
                                  icon: Icon(_retypepasswordvisibility
                                      ? Icons.visibility
                                      : Icons.visibility_off)))),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              if (passwordcontroller.text ==
                                  retypepasswordcontroller.text) {
                                register();
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text("Passwords are must be matched"),
                                ));
                              }
                            }
                          },
                          child: Text('Register')),
                      SizedBox(
                        height: 50,
                      ),
                      Text('Already Registered'),
                      ElevatedButton(
                          onPressed: () => {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Firebaselogin()))
                              },
                          child: Text('Sign In'))
                    ],
                  ),
                ))),
          ));
  }
}
