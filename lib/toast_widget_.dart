import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget extends StatefulWidget {
  const ToastWidget({Key? key}) : super(key: key);

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toast Widget"),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.red,
          child: const Text(
            "Show Toast",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onPressed: showToast,
        ),
      ),
    );
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: 'Email Sent',
        toastLength: Toast.LENGTH_LONG,
        fontSize: 15.0,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }
}
