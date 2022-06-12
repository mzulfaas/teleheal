import 'package:flutter/material.dart';
import 'package:teleheal_mzulfaas/feature/dashboard/dashboard_page.dart';

class MainDashboardPage extends StatefulWidget {

  MainDashboardPage({Key? key}) : super(key: key);


  @override
  _MainDashboardPageState createState() => _MainDashboardPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainDashboardPageState extends State<MainDashboardPage> {
  int _selectedItemIndex = 0;



  @override
  Widget build(BuildContext context) {

    final List pages = [
      DashboardPage(),
      Container(
        child: Center(
          child: Text("RS"),
        ),
      ),
      Container(
        child: Center(
          child: Text("Klinik"),
        ),
      ),
      Container(
        child: Center(
          child: Text("Profile"),
        ),
      ),
    ];

    print("Ini bottom nav");
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 50,
          backgroundColor: Color(0xFFF0F0F0),
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          selectedIconTheme: IconThemeData(color: Colors.red[600]),
          currentIndex: _selectedItemIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _selectedItemIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "HOME",
              icon: Icon(Icons.circle_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: "RS",
              icon: Icon(Icons.circle_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: "KLINIK",
              icon: Icon(Icons.circle_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: "PROFILE",
              icon: Icon(Icons.circle_outlined,
              ),
            ),
          ],
        ),
        body: pages[_selectedItemIndex]
    );
  }
}