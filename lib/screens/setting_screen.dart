import 'package:flutter/material.dart';
import 'package:match_map_apk/provider/setting_provider.dart';
import 'package:match_map_apk/utility/demo_lists.dart';
import 'package:match_map_apk/widgets/custom_slider.dart';
import 'package:match_map_apk/widgets/custom_test_field.dart';
import 'package:match_map_apk/widgets/location_card_builder.dart';
import 'package:match_map_apk/widgets/section_header.dart';
import 'package:match_map_apk/widgets/sports_categories.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 28,
                ),
                Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          /// horizontal text
          SizedBox(
            height: 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Text(
                    DemoLists.roadName[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// horizontal category list
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // header
                      SectionHeader(title: 'Sportarten'),

                      // categories
                      SportsCategories(sportName: DemoLists.sportName),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// textField 1 & 2
                  Consumer<SettingProvider>(
                      builder: (context, textFieldProvider, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionHeader(title: 'Uhrzeit'),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Ab',
                                suffixIcon: Icons.keyboard_arrow_down_rounded,
                                onChanged: (value) {
                                  textFieldProvider.setTextField1(value);
                                },
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Bis',
                                suffixIcon: Icons.keyboard_arrow_down_rounded,
                                onChanged: (value) {
                                  textFieldProvider.setTextField2(value);
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 24),

                  /// textField 3
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionHeader(title: 'Stadt'),
                      Consumer<SettingProvider>(
                          builder: (context, textFieldProvider, _) {
                        return CustomTextField(
                          hintText: 'Stadt Order Postleihzahi',
                          onChanged: (value) {
                            textFieldProvider.setTextField3(value);
                          },
                        );
                      })
                    ],
                  ),
                  const SizedBox(height: 24),

                  /// slider
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SectionHeader(title: 'Umkreis'),
                          Consumer<SettingProvider>(
                              builder: (context, distanceProvider, _) {
                            return Text(
                              '${distanceProvider.sliderValue.toInt()}Km',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            );
                          }),
                        ],
                      ),
                      const CustomSlider(),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// location
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(title: 'Location'),
                      LocationCardBuilder(locationName: DemoLists.locationName),
                    ],
                  ),
                  // const SizedBox(height: 24),

                  /// elevated submit button
                  SizedBox(
                    width: double.infinity,
                    child: Consumer<SettingProvider>(
                        builder: (context, addDataProvider, _) {
                      return ElevatedButton(
                        onPressed: () {
                          addDataProvider.addData();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Filter anwenden',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
