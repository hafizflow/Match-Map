import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:match_map_apk/provider/setting_provider.dart';
import 'package:match_map_apk/screens/map_screen.dart';
import 'package:match_map_apk/screens/setting_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MatchMapApp());
}

class MatchMapApp extends StatelessWidget {
  const MatchMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      builder: (context, snapshot) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MapScreen(),
        );
      },
    );
  }
}
