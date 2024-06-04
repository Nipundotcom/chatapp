import 'package:chatapp/dashboard.dart';
import 'package:chatapp/register.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/forgotpassword.dart';
import 'package:chatapp/utils/button.dart';
import 'package:chatapp/utils/media.dart';
import 'package:chatapp/utils/textfeilds.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/colornotifire.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late ColorNotifire notifire;

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: height,
                width: width,
                color: Colors.transparent,
                child: Image.asset(
                  "images/background.png",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: height / 20,
                  ),
                  Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: notifire.getdarkscolor,
                          fontFamily: 'Gilroy Bold',
                          fontSize: height / 35),
                    ),
                  ),
                  SizedBox(
                    height: height / 12.2,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: height / 1.5,
                          width: width / 1.1,
                          decoration: BoxDecoration(
                            color: notifire.gettabwhitecolor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height / 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 18,
                                  ),
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      color: notifire.getdarkscolor,
                                      fontSize: height / 50,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height / 70,
                              ),
                              Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/email.png",
                                  'Emailid',
                                  notifire.getdarkwhitecolor),
                              SizedBox(
                                height: height / 35,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 18,
                                  ),
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      color: notifire.getdarkscolor,
                                      fontSize: height / 50,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height / 70,
                              ),
                              Customtextfilds.textField(
                                  notifire.getdarkscolor,
                                  notifire.getdarkgreycolor,
                                  notifire.getbluecolor,
                                  "images/password.png",
                                  'Password',
                                  notifire.getdarkwhitecolor),
                              SizedBox(
                                height: height / 35,
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPassword(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: height / 40,
                                      color: Colors.transparent,
                                      child: Text(
                                        'Forget Password?',
                                        style: TextStyle(
                                            color: notifire.getdarkscolor,
                                            fontSize: height / 60,
                                            fontFamily: 'Gilroy Medium'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width / 18,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height / 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Dashboard(),
                                    ),
                                  );
                                },
                                child: Custombutton.button(
                                    notifire.getbluecolor, 'Signin', width / 2),
                              ),
                              SizedBox(
                                height: height / 50,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: height / 700,
                                      width: width / 3,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "or",
                                      style: TextStyle(
                                        color: notifire.getdarkgreycolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                    Container(
                                      height: height / 700,
                                      width: width / 3,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height / 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      color: notifire.getdarkgreycolor
                                          .withOpacity(0.9),
                                      fontSize: height / 50,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width / 100,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Register(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Register here',
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: height / 10,
                  ),
                  Center(
                    child: Icon(Icons.message, size: 80, color: notifire.getdarkscolor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
