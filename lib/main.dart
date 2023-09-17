import 'package:flutter/material.dart';
import 'package:firechat/features/auth/controller/auth_service.dart';
import 'package:provider/provider.dart';

import 'constants/app_exports.dart';
import 'package:firechat/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      home: const RootApp(),
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}
