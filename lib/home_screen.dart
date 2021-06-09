import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcelpros/user_home_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 1;

  List<Widget> _widgetOption = <Widget>[
    UserHomeScreen(),
    UserHomeScreen(),
    UserHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: [
          BottomNavigationBarItem(icon: Image.asset("assets/images/bulb.png"), label: "Lights",),
          BottomNavigationBarItem(icon: Image.asset("assets/images/Icon feather-home.png"), label: "Home"),
          BottomNavigationBarItem(icon: Image.asset("assets/images/Icon feather-settings.png"), label: "Courses"),
        ],
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        },
        selectedItemColor: Colors.deepOrange,
      ),
      body: _widgetOption.elementAt(_selectedIndex)
     );
  }

}

