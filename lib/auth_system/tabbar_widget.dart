import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/auth_system/login.dart';
import 'package:flutter_academy_ar/auth_system/register.dart';
import 'package:flutter_academy_ar/firebase_options.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
     );
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Academy"),
            bottom:  const TabBar(
              tabs: [
                Tab(
                    icon: Icon(Icons.login),
                    text: 'Login'),
                Tab(
                    icon: Icon(Icons.app_registration),
                    text: 'Register'),
              ],
            ),
          ),
          body:  TabBarView(
            children: [
              Login(),
              RegistrationScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
