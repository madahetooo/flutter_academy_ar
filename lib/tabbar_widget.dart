import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/login.dart';
import 'package:flutter_academy_ar/register.dart';

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({Key? key}) : super(key: key);

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget> {
  @override
  Widget build(BuildContext context) {
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
          body: const TabBarView(
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
