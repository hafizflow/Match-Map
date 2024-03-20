import 'package:flutter/material.dart';
import 'package:match_map_apk/utility/demo_lists.dart';
import 'package:provider/provider.dart';

import '../provider/setting_provider.dart';

// location card grid view builder
class LocationCardBuilder extends StatelessWidget {
  const LocationCardBuilder({
    super.key,
    required this.locationName,
  });

  final List<String> locationName;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Consumer<SettingProvider>(
            builder: (context, locationProvider, _) {
          return GestureDetector(
            onTap: () {
              locationProvider.setSelectedLocation(index);
              locationProvider.location = DemoLists.locationName[index];
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: locationProvider.selectedLocation == index
                      ? Colors.green
                      : Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/location_$index.png',
                    width: 35,
                    color: locationProvider.selectedLocation == index
                        ? Colors.black
                        : Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    locationName[index],
                    style: TextStyle(
                      color: locationProvider.selectedLocation == index
                          ? Colors.black
                          : Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
