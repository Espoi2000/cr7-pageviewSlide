import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secondaniatedgallery/movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movies});
  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(102, 0, 0, 0), blurRadius: 4)
          ]),
      margin: const EdgeInsets.fromLTRB(8, 250, 8, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                movies.image!,
                height: 290,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            movies.title.toString(),
            style: const TextStyle(fontSize: 24.3, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (_) => const Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.orange,
                    )),
          )
        ],
      ),
    );
  }
}
