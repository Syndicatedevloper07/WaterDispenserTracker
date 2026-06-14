
import 'package:flutter/material.dart';
import 'package:panipelo/HomePage.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff4f8fb),
        toolbarHeight: 0,
      ),
      backgroundColor: Color(0xfff4f8fb),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.heightOf(context) * 0.1,),
            Image.asset("Asset/Water1.png", width: double.infinity,fit: BoxFit.fill,),
            Container(
              width: double.infinity,
              height: MediaQuery.heightOf(context) * 1,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Color(0xff389ffd),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.widthOf(context) * 0.3,
                    height: MediaQuery.heightOf(context) * 0.14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(99),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(40),
                          offset: Offset(-1, 1),
                          blurRadius: 1,
                          spreadRadius: 3

                        )
                      ]
                    ),
                    child: Center(
                      child: Image.asset(
                        "Asset/Machine.png",
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.heightOf(context) * 0.05,),
                  Text("Welcome Back!", style: TextStyle(color: Colors.white, fontFamily: 'Noto', fontSize: 20, fontWeight: FontWeight.w700),),
                  SizedBox(height: MediaQuery.heightOf(context) * 0.01,),
                  Text("Login to monitor your \n water dispenser",textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontFamily: 'Noto', fontSize: 12,),),
                  SizedBox(height: MediaQuery.heightOf(context) * 0.05,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.heightOf(context) * 0.15,
                          padding: EdgeInsetsGeometry.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.person_2_outlined,
                                    color: Color(0xff389ffd),
                                  ),
                              
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.widthOf(context) * 0.03),
                                      child: SizedBox(
                                        height: 40, // Adjust this value
                                        child: TextFormField(
                                          decoration:  InputDecoration(
                                            hintText: "Username",
                                            border: InputBorder.none,
                                            isDense: true,
                                            hintStyle: TextStyle(color: Colors.grey.shade600, fontFamily: 'Noto', fontSize: 12)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: Divider(color: Colors.grey.shade300,)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.password,
                                    color: Color(0xff389ffd),
                                  ),
                              
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.widthOf(context) * 0.03,),
                                      child: SizedBox(
                                        height: 40, // Adjust this value
                                        child: TextFormField(
                                          obscureText: true,
                                          decoration:  InputDecoration(
                                            hintText: "UID",
                                            border: InputBorder.none,
                                            isDense: true,
                                            hintStyle: TextStyle(color: Colors.grey.shade600, fontFamily: 'Noto', fontSize: 12)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value ?? false;
                                });
                              },
                            ),
                            const Text(
                              "Remember Me",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Noto',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.heightOf(context) * 0.03,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return Homepage();
                      }));
                    },
                        style: ElevatedButton.styleFrom(

                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        child: Center(child: Text("Login", style: TextStyle(color: Color(0xff389ffd),  fontFamily: 'Noto', fontSize: 14, fontWeight: FontWeight.w900),),)),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


