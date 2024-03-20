import 'package:flutter/material.dart';
import 'package:match_map_apk/utility/demo_lists.dart';
import 'package:provider/provider.dart';

import '../provider/setting_provider.dart';

// sports categories
class SportsCategories extends StatelessWidget {
  const SportsCategories({
    super.key,
    required this.sportName,
  });

  final List<String> sportName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Column(
              children: [
                Consumer<SettingProvider>(
                    builder: (context, sportsProvider, _) {
                  return GestureDetector(
                    onTap: () {
                      sportsProvider.setSelectedIndex(index);
                      sportsProvider.sports = DemoLists.sportName[index];
                    },
                    child: Container(
                      height: 62,
                      width: 62,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: index == sportsProvider.selectedIndex
                              ? Colors.green
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/sports_$index.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 4),
                SizedBox(
                  width: 60,
                  child: Text(
                    sportName[index],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
