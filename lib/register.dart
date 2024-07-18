import 'package:chatapp/dashboard.dart';
import 'package:chatapp/login.dart';
import 'package:chatapp/utils/auth_service.dart';
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

  final TextEditingController e = TextEditingController();
  final TextEditingController pwd = TextEditingController();
  final TextEditingController cpwd = TextEditingController();

  void Register() async {
    final authService = AuthService();
    try{
      if(pwd.text == cpwd.text)
      {
        var userCredential = await  authService.signUpWithEmailPassword(e.text, pwd.text);
        if (userCredential.user != null) {
        await Future.delayed(const Duration(seconds: 1));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      } 

    }
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
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
                            height: height / 1.3,
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
                                    controller: e,
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
                                    controller: pwd,
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
                                    controller: cpwd,
                                    notifire.getdarkwhitecolor),
                                SizedBox(
                                  height: height / 35,
                                ),
                                SizedBox(
                                  height: height / 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Register();
                                  },
                                  child: Custombutton.button(
                                      notifire.getbluecolor, 'Signup', width / 2),
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
                                  height: height / 65,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account?",
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
                                                const Login(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Login',
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
      ),
    );
  }
}
