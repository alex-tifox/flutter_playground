import 'package:flutter/material.dart';
import 'package:flutter_playground/google_maps_screen/widgets/find_me_button.dart';
import 'package:flutter_playground/google_maps_screen/widgets/google_map_search_bar.dart';
import 'package:flutter_playground/google_maps_screen/widgets/searching_chips_list.dart';

class GoogleMapsScreen extends StatelessWidget {
  static const String screenName = 'GoogleMapsScreen';
  const GoogleMapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: ColoredBox(
              color: Colors.blueGrey,
            ),
          ),
          const Positioned(
            top: 16,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: GoogleMapSearchBar(),
                ),
                SizedBox(height: 8),
                SizedBox(height: 40, child: SearchingChipsList()),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: FindMeButton(
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
