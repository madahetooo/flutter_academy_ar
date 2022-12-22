import 'package:flutter/material.dart';

class ReverseStringApp extends StatefulWidget {
  const ReverseStringApp({Key? key}) : super(key: key);

  @override
  State<ReverseStringApp> createState() => _ReverseStringAppState();
}

class _ReverseStringAppState extends State<ReverseStringApp> {
  TextEditingController _reverseStringController = TextEditingController();
  String _reversed = "String should be reversed";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Reverse String App"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _reverseStringController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter a string to reverse",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                onPressed: () {
                  if (_reverseStringController.text.isEmpty) return;
                  setState(() {
                    _reversed = reverseString(_reverseStringController.text);
                  });
                },
                color: Colors.blue,
                child: Text(
                  "Reverse",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              if (_reversed != null) ...[
                Text(
                  _reversed,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

String reverseString(String initialWord) {
  return initialWord.split('').reversed.join();
}
