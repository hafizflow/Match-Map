import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:match_map_apk/provider/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../widgets/custome_appbar.dart';
import '../widgets/panel_widget.dart';
import '../widgets/selected_location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String mapStyle = '';

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6941, 72.9734),
    zoom: 15,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DefaultAssetBundle.of(context)
        .loadString('assets/maptheme/silver_theme.json')
        .then((string) {
      mapStyle = string;
    }).catchError((error) {
      log("error$error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SettingProvider>(builder: (context, provider, _) {
        return SlidingUpPanel(
          onPanelOpened: () {
            provider.setPanelClosed(false);
          },
          onPanelClosed: () {
            provider.setPanelClosed(true);
          },
          minHeight: MediaQuery.of(context).size.height * 0.1,
          maxHeight: MediaQuery.of(context).size.height * 0.87,
          panelBuilder: (controller) {
            if (provider.isPanelClosed) {
              return const SelectedLocation();
            } else {
              return PanelWidget(controller: controller);
            }
          },
          body: Stack(
            children: [
              MyMap(
                kGooglePlex: _kGooglePlex,
                mapStyle: mapStyle,
                controller: _controller,
              ),
              const CustomAppBar(),
            ],
          ),
        );
      }),
    );
  }
}

class MyMap extends StatelessWidget {
  const MyMap({
    super.key,
    required CameraPosition kGooglePlex,
    required this.mapStyle,
    required Completer<GoogleMapController> controller,
  })  : _kGooglePlex = kGooglePlex,
        _controller = controller;

  final CameraPosition _kGooglePlex;
  final String mapStyle;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _kGooglePlex,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        controller.setMapStyle(mapStyle);
        // _controller.complete(controller);
      },
    );
  }
}
