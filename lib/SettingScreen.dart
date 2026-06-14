import 'package:flutter/material.dart';
import 'package:panipelo/LoginScreen.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF4F8FB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.015,
            bottom: 100, // Prevent bottom nav overlap
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Center(
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Noto',
                  ),
                ),
              ),

              const SizedBox(width: 48),

              SizedBox(height: height * 0.03),

              /// PREFERENCES TITLE
              const Text(
                "Preferences",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Noto',
                ),
              ),

              SizedBox(height: height * 0.015),

              /// NOTIFICATIONS CARD
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Notifications",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff4D5A73),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Noto'
                          ),
                        ),
                      ),

                      Switch(
                        value: notificationsEnabled,
                        activeColor: Colors.white,
                        activeTrackColor: const Color(0xff389ffd),
                        onChanged: (value) {
                          setState(() {
                            notificationsEnabled = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              /// ABOUT TITLE
              const Text(
                "About",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Noto',
                ),
              ),

              SizedBox(height: height * 0.015),

              /// ABOUT APP CARD
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        "About App",
                        style: TextStyle(
                          color: Color(0xff4D5A73),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Noto'
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        // Navigate to About Screen
                      },
                    ),

                    Divider(height: 1, color: Colors.grey.shade200),

                    ListTile(
                      title: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                            fontFamily: 'Noto'
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.white,
                              title: const Text("Logout", style: TextStyle(fontFamily: 'Noto', fontWeight: FontWeight.w600, fontSize: 18)),
                              content: const Text(
                                "Are you sure you want to logout?",  style: TextStyle(fontFamily: 'Noto',  fontSize: 14)
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel",
                                    style: TextStyle( fontFamily: 'Noto',),),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                      return LoginScreen();
                                    }));

                                    // Logout Logic Here
                                  },
                                  child:  Text(
                                    "Logout",
                                    style: TextStyle(color: Colors.red, fontFamily: 'Noto',),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
