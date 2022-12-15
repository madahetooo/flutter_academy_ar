import 'package:flutter/material.dart';

class BasicWidgetsScreen extends StatefulWidget {
  const BasicWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<BasicWidgetsScreen> createState() => _BasicWidgetsScreenState();
}

class _BasicWidgetsScreenState extends State<BasicWidgetsScreen> {
  List<String> images = [
    "https://docs.flutter.dev/assets/images/dash/Dash.png",
    "https://lh3.googleusercontent.com/y1xqD3HBWkLdTf646GDJREHU5KfVzqzHCA3WDORTkGnNcvwdsloSPKVk_LB00xWq5Ur9kxHxteTiHE2fJQ8wklvt0UczmRwALoRV8sATIl8BeMSdw1s3sjcqHdUWBt9Gqj0e25evBOo=w500",
    "https://pbs.twimg.com/media/D2iE-7mU0AAJqxj.jpg",
    "https://pbs.twimg.com/media/Dtbmvj4WsAE6sq8?format=jpg&name=4096x4096"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Widgets"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (BuildContext context, int index){
              return Image.network(images[index]);
            }),
      ),
    );
  }
}
