import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/auth_system/register.dart';
import 'package:flutter_academy_ar/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 180,
                child: Image.asset(
                  "assets/dashatars.png",
                  fit: BoxFit.contain,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  label: Text("Email Address"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  label: Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Material(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
                elevation: 5,
                child: MaterialButton(
                  onPressed: () async {
                    final _googleSignIn = GoogleSignIn();
                    final googleAccount = await _googleSignIn.signIn();
                    print(googleAccount!.email);
                    final googleCredential = await googleAccount.authentication;

                    final authCredential = GoogleAuthProvider.credential(
                      idToken: googleCredential.idToken,
                      accessToken: googleCredential.accessToken
                    );
                  final firebaseUser =
                  await  FirebaseAuth.instance.signInWithCredential(authCredential);
                    print(firebaseUser.user!.uid);
                    print(firebaseUser.user!.displayName);
                    print(firebaseUser.user!.email);
                    print(firebaseUser.user!.phoneNumber);
                    print(firebaseUser.user!.photoURL);
                    print(firebaseUser.user!.emailVerified);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account !?  "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationScreen()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
