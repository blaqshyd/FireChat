import 'package:firechat/core/app.dart';
import 'package:firechat/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/app_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}
