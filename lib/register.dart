import 'package:flutter/material.dart';
import 'package:chatapp/utils/button.dart';
import 'package:chatapp/utils/media.dart';
import 'package:chatapp/utils/textfeilds.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/colornotifire.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  Row(
                    children: [
                      SizedBox(
                        width: width / 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: notifire.getdarkscolor,
                        ),
                      ),
                      SizedBox(
                        width: width / 4,
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                            color: notifire.getdarkscolor,
                            fontFamily: 'Gilroy Bold',
                            fontSize: height / 35),
                      ),
                    ],
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
                                  SizedBox(
                                    width: width / 18,
                                  ),
                                  Text(
                                    'Confirm Password',
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
                                  'Confirm Password',
                                  notifire.getdarkwhitecolor),
                              SizedBox(
                                height: height / 35,
                              ),
                              SizedBox(
                                height: height / 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Custombutton.button(
                                    notifire.getbluecolor, 'Signup', width / 2),
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
                    child: Image.asset(
                      "images/logos.png",
                      height: height / 7,
                    ),
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
