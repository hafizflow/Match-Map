import 'package:flutter/material.dart';
import 'package:match_map_apk/screens/setting_screen.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  const PanelWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return const SettingScreen();
  }
}
