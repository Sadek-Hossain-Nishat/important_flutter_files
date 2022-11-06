import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practiceflutter/flutterfirebase/userauth/googlesignin/UserHomePageafterGoogleSign.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GoogleSignInPage());
}

class GoogleSignInPage extends StatelessWidget {
  const GoogleSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainAuthPage(),
    );
  }
}

class MainAuthPage extends StatefulWidget {
  const MainAuthPage({Key? key}) : super(key: key);

  @override
  State<MainAuthPage> createState() => _MainAuthPageState();
}

class _MainAuthPageState extends State<MainAuthPage> {
  bool userExist = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        ? UserHomePageafterGoogleSign()
        : Scaffold(
            appBar: AppBar(
              title: Text('Google Sign In'),
              centerTitle: true,
            ),
            body: Center(
                child: Container(
              height: 100,
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Colors.white)))),
                  onPressed: () {
                    googleSignIn();
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'images/googlelogo.png',
                        height: 70,
                        width: 70,
                      ),
                      Text(
                        'Sign With Google',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )
                    ],
                  )),
            )),
          );
  }

  Future<UserCredential> googleSignIn() async {
// Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
