// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:relief_fund/firebase_options.dart';
import 'package:relief_fund/widgets/notification.dart';
import 'package:relief_fund/widgets/route.dart';
import 'package:relief_fund/widgets/colors.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AllNotification().initNotification();
  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    print('Notification permission: $status');
  }

  await requestNotificationPermission();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
      initialRoute: AppRoutes.opening,
      routes: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
