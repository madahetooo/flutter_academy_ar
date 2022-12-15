import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location = "";
  String time = "";
  String flag = "";
  String endPoint = "";
  bool isDayTime = true;

  WorldTime(
      {required this.location, required this.flag, required this.endPoint});

  Future<void> getTime() async {
    try {
      Response response = await get(

          Uri.parse('http://worldtimeapi.org/api/timezone/$endPoint'));
      Map data = jsonDecode(response.body);
      String dateTime = data['utc_datetime'];
      String offsetTime = data['utc_offset'].substring(1,3);
      print("The date time now is $dateTime");
      print("The offset time now is $offsetTime");

      DateTime nowTime = DateTime.parse(dateTime);
      nowTime = nowTime.add(Duration(hours: int.parse(offsetTime)));
      print(nowTime);

      time = DateFormat.jm().format(nowTime);
      print(time);
      isDayTime = nowTime.hour > 6 && nowTime.hour < 18 ? true : false ;

    } catch (e) {
      print("Caught Error: $e");
    }
  }
}
