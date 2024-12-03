import 'package:first_flutter_project/models/film.dart';
import 'package:first_flutter_project/screens/details_film_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardFilm extends StatelessWidget {
  Film film;

  CardFilm(this.film, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsFilmScreen(film)));
      },
      child: Card(
        elevation: 5.0, // Controls shadow depth
        shadowColor: Colors.grey.withOpacity(0.5),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Image.asset(
                'assets/${film.image}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      film.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.amber,
                    )
                  ]),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
