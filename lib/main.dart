import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/utils/auth_gate.dart';
import 'package:chatapp/utils/colornotifire.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ColorNotifire(),
        ),
      ],
      child: const MaterialApp(
        home: AuthGate(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
