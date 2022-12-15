import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    String backgroundImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color backgroundColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    print(data);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$backgroundImage'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 120, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.grey,
                  onPressed: () {},
                  child: TextButton(
                      onPressed: () async {
                       dynamic result =  await Navigator.pushNamed(context, '/choose_location');
                       setState(() {
                         data ={
                           'time' : result['time'],
                           'location':result['location'],
                           'isDayTime':result['isDayTime'],
                           'flag':result['flag'],
                         };
                       });
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            "Edit Location",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30.0),
                 Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
