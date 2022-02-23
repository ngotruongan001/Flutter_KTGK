import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/screens/home_screen.dart';
import 'package:notification_app/screens/notification_screen.dart';
import 'package:notification_app/screens/search_screen.dart';

class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  _ScreensState createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  final items = const[
    Icon(Icons.home, size: 30,),
    Icon(Icons.search, size: 30,),
    Icon(Icons.notifications, size: 30,),
    Icon(Icons.person, size: 30,)
  ];
    int index = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.lightBlueAccent,
        bottomNavigationBar: CurvedNavigationBar(
          items: items,
          index: index,
          onTap: (selectedIndex){
            setState(() {
              index = selectedIndex;
            });
          },
          height: 70,
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
        ),
        body: Container(
          color: Colors.lightBlueAccent,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index),
        )
    );
  }
  Widget getSelectedWidget({required int index}){
    Widget  widgeta;
    switch(index){
      case 0:
        widgeta = const Home();
        break;
      case 1:
        widgeta = const Search();
        break;
      case 2:
        widgeta = const NotificationScreen();
        break;

      default:
        widgeta = const Home();
        break;
    }
    return widgeta;
  }
}
