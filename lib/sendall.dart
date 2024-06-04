import 'package:chatapp/chat.dart';
import 'package:flutter/material.dart';
import '../../utils/media.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colornotifire.dart';

class Sendall extends StatefulWidget {
  const Sendall({Key? key}) : super(key: key);

  @override
  _SendallState createState() => _SendallState();
}

class _SendallState extends State<Sendall> {
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

  List nametxt = [
    'tiana',
    'kaiya',
    'desirae',
    'emery',
    'ruben',
    'roger',
    'jaydon',
  ];

  List imgtxt = [
    "images/man5.png",
    "images/man5.png",
    "images/man5.png",
    "images/man5.png",
    "images/man5.png",
    "images/man5.png",
    "images/man5.png",
  ];

  handleClick(String value) {
    switch (value) {
      case 'Delete':
        break;
      case 'Block':
        break;
    }
  }

  bool selectedindex = false;
  bool selectedindex1 = false;
  bool selectedindex2 = false;
  bool selectedindex3 = false;
  bool selectedindex4 = false;
  bool selectedindex5 = false;
  bool selectedindex6 = false;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 50,
            ),
            Container(
              height: height / 1.1,
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: nametxt.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Chat(),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              height: height / 15,
                              width: width / 7,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle),
                              child: Image.asset(
                                imgtxt[index],
                              ),
                            ),
                            SizedBox(
                              width: width / 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nametxt[index],
                                  style: TextStyle(
                                      fontSize: height / 45,
                                      color: notifire.getdarkscolor,
                                      fontFamily: 'Gilroy Bold'),
                                ),
                                SizedBox(
                                  height: height / 200,
                                ),
                                Text(
                                  'bca1',
                                  style: TextStyle(
                                      fontSize: height / 55,
                                      color: Colors.grey,
                                      fontFamily: 'Gilroy Medium'),
                                ),
                              ],
                            ),
                            const Spacer(),
                            PopupMenuButton<String>(
                              color: notifire.getdarkscolor,
                              onSelected: handleClick,
                              itemBuilder: (BuildContext context) {
                                return {'Delete', 'Block'}.map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                  );
                                }).toList();
                              },
                            ),
                            SizedBox(
                              width: width / 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
