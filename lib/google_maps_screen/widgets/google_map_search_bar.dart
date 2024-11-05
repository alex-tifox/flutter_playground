import 'package:flutter/material.dart';

class GoogleMapSearchBar extends StatelessWidget {
  const GoogleMapSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchBar(
      hintText: 'Search',
      leading: Icon(Icons.search),
      trailing: [
        Icon(Icons.mic),
        SizedBox(width: 8),
        CircleAvatar(child: Icon(Icons.person))
      ],
    );
  }
}
