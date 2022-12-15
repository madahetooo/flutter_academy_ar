import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/basic_widget_app/basic_widgets.dart';
import 'package:flutter_academy_ar/basic_widget_app/list_view_widget.dart';
import 'package:flutter_academy_ar/basic_widget_app/toast_widget_.dart';


class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {

  int currentIndex = 0;

  void onItemTapped(int index){
    setState(() {
      currentIndex = index;
    });
  }


  List<Widget> widgetsScreens = [
    Text("HOME"),
    Text("HOME"),
    Text("HOME"),
  ];

  final _widgetList =[
    BasicWidgetsScreen(),
    ListViewWidget(),
    ToastWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetList[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        iconSize: 25,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        onTap: onItemTapped,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.grid_3x3,
          ),
          label: 'Grid View'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'List View'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.touch_app_sharp,
              ),
              label: 'Toast'
          ),
        ],
      ),
    );
  }
}
