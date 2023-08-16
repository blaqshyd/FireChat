import 'package:flutter/material.dart';
import 'constants/app_exports.dart';
import 'package:gesture/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      home: const Home(),
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}
