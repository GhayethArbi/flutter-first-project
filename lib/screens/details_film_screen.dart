import 'package:first_flutter_project/models/film.dart';
import 'package:first_flutter_project/screens/sign_up_screen.dart';
import 'package:first_flutter_project/services/film_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsFilmScreen extends StatelessWidget {
  final Film film;
  

  const DetailsFilmScreen(this.film, {super.key});

  @override
  Widget build(BuildContext context) {
    final filmService = FilmService();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            film.title,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,

          // backgroundColor: Colors.white, //add background color black
        ),
        body: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
              child: Image.asset("assets/${film.image}"),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(film.description),
            ),
            const SizedBox(height: 30),
            Text(
              film.price,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  
                  filmService.insertFilm(film);

                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ));*/
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.shopping_cart, color: Colors.white),
                  Text(" Acheter", style: TextStyle(color: Colors.white)),
                ])),
          ],
        ));
  }
}
