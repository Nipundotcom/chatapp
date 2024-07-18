import 'package:chatapp/chat.dart';
import 'package:chatapp/services/chatService.dart';
import 'package:chatapp/utils/auth_service.dart';
import 'package:flutter/material.dart';
// import '../../utils/media.dart';
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

  final chatService = ChatService();
  final authService = AuthService();

  handleClick(String value) {
    switch (value) {
      case 'Delete':
        break;
      case 'Block':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
              child: buildUserList()
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserList() {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: chatService.getUserStreams(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error Getting UserList");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chat(
                          receiverEmail: snapshot.data![index]['email'],
                          receiverID: snapshot.data![index]['uid']
                          ),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        if(snapshot.data![index]['email'] != authService.getCurrentUser()!.email)...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index]['email'],
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
                        ]
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
              ],
            ),
          );
        });
  }
}
