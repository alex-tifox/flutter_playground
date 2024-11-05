import 'package:flutter/material.dart';
import 'package:flutter_playground/animated_custom_paint/animated_custom_paint.dart';
import 'package:flutter_playground/authentication_scope/auth_screen.dart';
import 'package:flutter_playground/custom_paint_map_pin/custom_paint_pin_screen.dart';
import 'package:flutter_playground/google_maps_screen/google_maps_screen.dart';

class FeaturesMenuList extends StatelessWidget {
  const FeaturesMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // TODO(OT): commit this feature
        // ListTile(
        //   title: const Text(NoListBuilderScreen.screenName),
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => NoListBuilderScreen()),
        //     );
        //   },
        // ),
        ListTile(
          title: const Text(GoogleMapsScreen.screenName),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GoogleMapsScreen()),
            );
          },
        ),
        ListTile(
          title: const Text('CustomPaintPinScreen'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CustomPaintPinScreen()),
            );
          },
        ),
        ListTile(
          title: const Text('AnimatedCustomPaintPinScreen'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AnimatedPainterExample()),
            );
          },
        ),
        // TODO(OT): commit this feature
        // ListTile(
        //   title: const Text('MapboxMapScreen'),
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const MapboxMapScreen()),
        //     );
        //   },
        // ),
        ListTile(
          title: const Text('AuthenticationScope'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AuthScreen()),
            );
          },
        ),
      ],
    );
  }
}
