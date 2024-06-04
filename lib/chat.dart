import 'package:chatapp/utils/colornotifire.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatapp/utils/media.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: notifire.getdarkscolor),
        elevation: 0,
        backgroundColor: notifire.getpurplcolor,
        title: Text(
          'userName',
          style: TextStyle(
              color: notifire.getdarkscolor,
              fontFamily: 'Gilroy Bold',
              fontSize: height / 35),
        ),
        centerTitle: false,
      ),
      backgroundColor: notifire.getprimerycolor,
      body: Container(
        height: height,
        width: width / 0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/chat-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                autofocus: false,
                style: TextStyle(
                  fontSize: height / 50,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: notifire.gettabwhitecolor,
                  hintText: 'Enter Message...',
                  suffixIcon: Icon(
                    Icons.send,
                    color: notifire.getdarkscolor,
                  ),
                  hintStyle:
                      TextStyle(color: Colors.grey, fontSize: height / 40),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: notifire.getpurplcolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: notifire.getpurplcolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}