import 'package:flutter/material.dart';
import 'package:panipelo/MainHomePage.dart';
import 'package:panipelo/ReportScreen.dart';
import 'package:panipelo/SettingScreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int selectedIndex = 0;
  final pages = [
    const Mainhomepage(),
    const Reportscreen(),
    const Settingscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomSheet: Container(
        height: 85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navItem(
              icon: Icons.home_rounded,
              label: "Home",
              isSelected: selectedIndex == 0,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            Container(
              height: 20,
              width: 2,
              color: Colors.grey.shade300,
            ),
            _navItem(
              icon: Icons.bar_chart_rounded,
              label: "Reports",
              isSelected: selectedIndex == 1,
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            Container(
              height: 20,
              width: 2,
              color: Colors.grey.shade300,
            ),
            _navItem(
              icon: Icons.settings_rounded,
              label: "Settings",
              isSelected: selectedIndex == 2,
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget _navItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 25,
            color: isSelected
                ? const Color(0xff389ffd)
                : Colors.grey,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xff389ffd)
                  : Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Noto'
            ),
          ),
        ],
      ),
    );
  }
}
