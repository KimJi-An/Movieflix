import 'package:flutter/material.dart';

class Movie extends StatelessWidget {
  final String title, poster;
  final int id;

  const Movie({
    super.key,
    required this.title,
    required this.poster,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Column(
        children: [
          Container(
            width: 200,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [

              ],
            ),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500$poster',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}