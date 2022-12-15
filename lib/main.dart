import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/auth_system/login.dart';
import 'package:flutter_academy_ar/basic_widget_app/basic_widgets.dart';
import 'package:flutter_academy_ar/home.dart';
import 'package:flutter_academy_ar/auth_system/register.dart';
import 'package:flutter_academy_ar/auth_system/tabbar_widget.dart';
import 'package:flutter_academy_ar/world_timer_app/ui/choose_location.dart';
import 'package:flutter_academy_ar/world_timer_app/ui/landing_page.dart';
import 'package:flutter_academy_ar/world_timer_app/ui/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/tabbarWidget',
  routes: {
    '/login' : (context) => Login(),
    '/register' : (context) => RegistrationScreen(),
    '/home' : (context) => HomeScreen(),
    '/basicWidget' : (context) => BasicWidgetsScreen(),
    '/tabbarWidget' : (context) => TabbarWidget(),
    '/choose_location' : (context) => ChooseLocation(),
    '/landing_page' : (context) => LandingPage(),
    '/loading_screen' : (context) => LoadingScreen(),
  },
));