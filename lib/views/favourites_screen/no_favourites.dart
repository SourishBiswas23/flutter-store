import 'package:flutter/material.dart';

class NoFavourites extends StatelessWidget {
  const NoFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There are no Favourite products',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.grey,
        ),
      ),
    );
  }
}
