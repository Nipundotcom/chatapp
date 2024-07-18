import 'dart:async';
import 'package:chatapp/login.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/utils/colornotifire.dart';
import 'package:provider/provider.dart';
import 'package:chatapp/utils/media.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }
  
  late Timer _timer;
  
  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
    _timer = Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Cancel the Timer in the dispose method
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: Column(
        children: [
          SizedBox(
            height: height / 2.4,
          ),
          Center(
            child: Icon(Icons.message, size: 80, color: notifire.getdarkscolor),
          ),
          SizedBox(
            height: height / 40,
          ),
          Text(
            "Let's Have A Chat",
            style: TextStyle(
                color: notifire.getdarkscolor,
                fontFamily: 'Gilroy Bold',
                fontSize: height / 35),
          ),
        ],
      ),
    );
  }
}
