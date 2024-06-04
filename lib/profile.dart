import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/colornotifire.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: notifire.getdarkscolor),
        elevation: 0,
        backgroundColor: notifire.getprimerycolor,
        title: Text(
          'Profile',
          style: TextStyle(
              color: notifire.getdarkscolor,
              fontFamily: 'Gilroy Bold',
              fontSize: height / 40),
        ),
        centerTitle: true,
      ),
      backgroundColor: notifire.getprimerycolor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    height: height / 8,
                    width: width / 4,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("images/man4.png"),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    'Brooklyn Simmons',
                    style: TextStyle(
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Bold',
                        color: notifire.getdarkscolor),
                  ),
                  SizedBox(height: height / 100),
                  Text(
                    '@Broklyn',
                    style: TextStyle(
                      fontSize: height / 55,
                      fontFamily: 'Gilroy Medium',
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: height / 50),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 20,
                      ),
                      const Text(
                        'Personal Informations',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: settingtype(
                        "images/profile.png", 'Your profile'),
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Divider(
                      thickness: 0.8,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(height: height / 50),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 20,
                      ),
                      const Text(
                        'Basic Settings',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  darkmode("images/darkmode.png", 'Darkmode'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Divider(
                      thickness: 0.7,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(height: height / 80),
                  GestureDetector(
                    onTap: () {},
                    child: settingtype("images/profilepassword.png", 'Change password'),
                  ),
                  SizedBox(height: height / 80),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Divider(
                      thickness: 0.6,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(height: height / 80),
                  GestureDetector(
                    onTap: () {},
                    child: settingtype("images/forgotpassword.png", 'Forgot password'),
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Divider(
                      thickness: 0.6,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(height: height / 50),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 20,
                      ),
                      const Text(
                        'General',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: settingtype("images/notification.png", 'Notification'),
                  ),
                  SizedBox(height: height / 80),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Divider(
                      thickness: 0.6,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(height: height / 80),
                  GestureDetector(
                    onTap: () {},
                    child: settingtype(
                        "images/languages.png", 'Languages'),
                  ),
                  SizedBox(height: height / 80),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Divider(
                      thickness: 0.6,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(height: height / 80),
                  GestureDetector(
                    onTap: () {},
                    child: settingtype(
                        "images/helps.png", 'Help and support'),
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Divider(
                      thickness: 0.6,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(height: height / 80),
                  GestureDetector(
                    onTap: () {},
                    child: settingtype(
                        "images/policy.png", 'Legal and Policy'),
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Divider(
                      thickness: 0.6,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showMyDialog();
                    },
                    child: Container(
                      width: width / 2,
                      height: height / 20,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                              color: const Color(0xffEB5757),
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 50),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: notifire.getprimerycolor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            height: height / 3,
            child: Column(
              children: [
                SizedBox(
                  height: height / 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const Spacer(),
                      Icon(
                        Icons.clear,
                        color: notifire.getdarkscolor,
                      ),
                      SizedBox(
                        width: width / 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                Text(
                  'Are you sure want to',
                  style: TextStyle(
                    color: notifire.getdarkscolor,
                    fontFamily: 'Gilroy Bold',
                    fontSize: height / 40,
                  ),
                ),
                Text(
                  'Log Out?',
                  style: TextStyle(
                    color: notifire.getdarkscolor,
                    fontFamily: 'Gilroy Bold',
                    fontSize: height / 40,
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: height / 18,
                    width: width / 2.5,
                    decoration: BoxDecoration(
                      color: notifire.getbluecolor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Gilroy Bold',
                            fontSize: height / 55),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 100,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: height / 18,
                    width: width / 2.5,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: const Color(0xffEB5757),
                            fontFamily: 'Gilroy Bold',
                            fontSize: height / 55),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget darkmode(image, title) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(width: width / 20),
        Image.asset(
          image,
          height: height / 34,
          color: notifire.getdarkscolor,
        ),
        SizedBox(width: width / 30),
        Text(
          title,
          style: TextStyle(
            color: notifire.getdarkscolor,
            fontSize: height / 50,
            fontFamily: 'Gilroy Bold',
          ),
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            trackColor: notifire.getdarkgreycolor,
            thumbColor: Colors.white,
            activeColor: notifire.getbluecolor,
            value: notifire.getIsDark,
            onChanged: (val) async {
              final prefs = await SharedPreferences.getInstance();
              setState(
                () {
                  notifire.setIsDark = val;
                  prefs.setBool("setIsDark", val);
                },
              );
            },
          ),
        ),
        SizedBox(width: width / 20)
      ],
    );
  }

  Widget settingtype(image, title) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Image.asset(
              image,
              height: height / 34,
              color: notifire.getdarkscolor,
            ),
            SizedBox(width: width / 30),
            Text(
              title,
              style: TextStyle(
                color: notifire.getdarkscolor,
                fontSize: height / 50,
                fontFamily: 'Gilroy Bold',
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget logout(image, title) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(width: width / 20),
        Image.asset(image, height: height / 27),
        SizedBox(width: width / 30),
        Text(
          title,
          style: TextStyle(
            color: const Color(0xffF75555),
            fontSize: height / 50,
            fontFamily: 'Gilroy Bold',
          ),
        ),
      ],
    );
  }
}
