import 'package:flutter/material.dart';

class DetailsTopSection extends StatelessWidget {
  const DetailsTopSection({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Centered image
        Center(
          child: SizedBox(
            width: 300.14,
            height: 271,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Close button at top left
        Positioned(
          top: 16,
          left: 10,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close, size: 28),
          ),
        ),

        // Favorite icon at top right
        Positioned(
          top: 16,
          right: 10,
          child: Icon(Icons.favorite, size: 28),
        ),
      ],
    );
  }
}

