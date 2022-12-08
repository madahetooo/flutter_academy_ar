import 'package:flutter/material.dart';
class BasicWidgetsScreen extends StatefulWidget {
  const BasicWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<BasicWidgetsScreen> createState() => _BasicWidgetsScreenState();
}

class _BasicWidgetsScreenState extends State<BasicWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic Widgets"),),
    );
  }
}
