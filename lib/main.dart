import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'widgets/login/login.dart';
import 'shared/bloc_observer.dart';
import 'widgets/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Widget startPoint;
  if (FirebaseAuth.instance.currentUser != null) {
    startPoint = const HomeWidget();
  } else {
    startPoint = const LoginScreen();
  }
  runApp(MyApp(
    startPoint: startPoint,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startPoint});

  final Widget startPoint;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maintenance App',
      debugShowCheckedModeBanner: false,
      home: startPoint,
    );
  }
}
