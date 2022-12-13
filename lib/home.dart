import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/basic_widgets.dart';
import 'package:flutter_academy_ar/bmi_calculator.dart';
import 'package:flutter_academy_ar/bottom_navigation_bar_widget.dart';
import 'package:flutter_academy_ar/list_view_widget.dart';
import 'package:flutter_academy_ar/toast_widget_.dart';
import 'package:flutter_academy_ar/todolist_app/todolist_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Academy App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavigationBarWidget()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.green,
                          offset: Offset(6.0, 6.0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        "Basic Widget App",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BMICalculator()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.green,
                          offset: Offset(6.0, 6.0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child:  Text(
                        "BMI Calculator",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodoListApp()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.green,
                          offset: Offset(6.0, 6.0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:const Center(
                      child:  Text(
                        "Todolist App",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BasicWidgetsScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.green,
                          offset: Offset(6.0, 6.0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        "World Timer App",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BasicWidgetsScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.green,
                          offset: Offset(6.0, 6.0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        "Chat App",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BasicWidgetsScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.green,
                          offset: Offset(6.0, 6.0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:const Center(
                      child: Text(
                        "Reverse String App",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text("Eslam Medhat",
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 15),),
              accountEmail: Text("ieslammedhat@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 18.0,
                backgroundImage: NetworkImage('https://user-images.githubusercontent.com/28203059/159008453-1fb9a75a-7503-41ae-9fe2-b70d8bdccc57.png'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  radius: 18.0,
                  backgroundImage: NetworkImage('https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/events/photo_2021-10-02_21-46-28_igQgwX6.jpg'),
                ),
              ],
            ),
            ListTile(
              title: Text('Sent'),
              leading: Icon(Icons.send),
            ),
            ListTile(
              title: Text('Inbox'),
              leading: Icon(Icons.inbox),
            ),
            ListTile(
              title: Text('Archive'),
              leading: Icon(Icons.archive),
            ),
            Divider(thickness: 1,),
            ListTile(
              title: Text('Starred'),
              leading: Icon(Icons.star),
            ),
            ListTile(
              title: Text('Updates'),
              leading: Icon(Icons.update),
            ),
            ListTile(
              title: Text('Community'),
              leading: Icon(Icons.people),
            ),
            Divider(thickness: 1,),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
