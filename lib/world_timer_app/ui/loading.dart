import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/world_timer_app/service/WorldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String time = "Loading";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Cairo', flag: 'dashatars.png', endPoint: 'Africa/Cairo');
    await instance.getTime();
    Navigator.pushNamed(context, '/landing_page',arguments: {
      'location': instance.location,
      'flag' : instance.flag,
      'time' :instance.time,
      'isDayTime' :instance.isDayTime,
    });
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }
  void initState(){
    super.initState();
    setupWorldTime();
  }
}
