import 'package:flutter/material.dart';

final searchingFeatures = [
  SearchingFeature(name: 'Restaurants', icon: Icons.restaurant),
  SearchingFeature(name: 'Hotels', icon: Icons.hotel),
  SearchingFeature(name: 'Parks', icon: Icons.park),
  SearchingFeature(name: 'Museums', icon: Icons.museum),
  SearchingFeature(name: 'Theatres', icon: Icons.theater_comedy),
  SearchingFeature(name: 'Cinemas', icon: Icons.local_movies),
  SearchingFeature(name: 'Gyms', icon: Icons.fitness_center),
  SearchingFeature(name: 'Spas', icon: Icons.spa),
  SearchingFeature(name: 'Shopping', icon: Icons.shopping_cart),
  SearchingFeature(name: 'Bars', icon: Icons.local_bar),
  SearchingFeature(name: 'Cafes', icon: Icons.local_cafe),
  SearchingFeature(name: 'Bakeries', icon: Icons.local_dining),
  SearchingFeature(name: 'Supermarkets', icon: Icons.local_grocery_store),
];

class SearchingChipsList extends StatelessWidget {
  const SearchingChipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SearchingChip(feature: searchingFeatures[index]),
        );
      },
      physics: const BouncingScrollPhysics(),
      itemCount: searchingFeatures.length,
      scrollDirection: Axis.horizontal,
    );
  }
}

class SearchingChip extends StatelessWidget {
  final SearchingFeature feature;
  const SearchingChip({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      elevation: 10,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(feature.icon),
          const SizedBox(width: 4),
          Text(feature.name),
        ],
      ),
      shape: const StadiumBorder(),
      onSelected: (bool value) {},
    );
  }
}

class SearchingFeature {
  final String name;
  final IconData icon;

  SearchingFeature({required this.name, required this.icon});
}
