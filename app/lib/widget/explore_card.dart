import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;

  const ExploreCard({
    super.key,
    required this.image,
    required this.title,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8), 
                  spreadRadius: 5,                   
                  blurRadius: 7,                     
                  offset: Offset(0, 3),   
                )
              ]
            ),
          ),
      
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(title),
            ),
          ),
      
          Positioned(
            bottom: 16,
            left: 20,
            child: const Text(
              'Explore Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      
          Positioned(
            bottom: 14,
            right: 14,
            child: Container(
              height: 44,
              width: 44,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_outward),
            ),
          ),
        ],
      ),
    );
  }
}
