import 'package:flutter/material.dart';
import 'emergency_home.dart';
import 'wearer_list.dart';
//import 'live_location.dart';


class EmergencyContactDashboard extends StatefulWidget {
  const EmergencyContactDashboard({super.key});

  @override
  State<EmergencyContactDashboard> createState() => _EmergencyContactDashboardState();
}

class _EmergencyContactDashboardState extends State<EmergencyContactDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const EmergencyHome(),
    const WearerList(),
    //const LiveLocationPage(),
  
  ];

  final List<String> _titles = [
    "Dashboard",
    "Wearer List",
    "Live Location",
    "Media Access",
    "Notifications",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: const Color(0xFF4A00E0),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Wearers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_media),
            label: "Media",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Alerts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
