import 'package:flutter/material.dart';
import 'package:match_map_apk/screens/setting_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  final PanelController controller;
  const PanelWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return const SettingScreen();
  }
}
