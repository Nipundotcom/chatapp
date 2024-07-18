import 'package:chatapp/services/chatService.dart';
import 'package:chatapp/utils/auth_service.dart';
import 'package:chatapp/utils/colornotifire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatapp/utils/media.dart';

class Chat extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
  const Chat({Key? key, required this.receiverEmail, required this.receiverID})
      : super(key: key);

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

  final TextEditingController _messageController = TextEditingController();
  final chatService = ChatService();
  final authService = AuthService();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await chatService.sendMessage(widget.receiverID, _messageController.text);
      _messageController.clear();
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
          widget.receiverEmail,
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
            Expanded(child: _buildMessageList()),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                controller: _messageController,
                autofocus: false,
                style: TextStyle(
                  fontSize: height / 50,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: notifire.gettabwhitecolor,
                  hintText: 'Enter Message...',
                  suffixIcon:IconButton(onPressed: sendMessage, icon: Icon(Icons.send,color: notifire.getdarkscolor,)),
                  hintStyle:TextStyle(color: Colors.grey, fontSize: height / 40),
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

  Widget _buildMessageList(){
    String senderID = authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessages(widget.receiverID, senderID), 
      builder: (context, snapshot){
        if (snapshot.hasError) {
            return const Text("Error Getting UserList");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
          );
      });
  }

  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data["senderID"] == authService.getCurrentUser()!.uid;
    return Container(
      decoration: BoxDecoration(
        color: notifire.getdarkgreycolor,
        borderRadius: BorderRadius.circular(12)
      ),
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      margin:  EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(data["message"], style: TextStyle(
            color: notifire.getdarkscolor,
          ),),
        ],
      ),
    );
  }
}
