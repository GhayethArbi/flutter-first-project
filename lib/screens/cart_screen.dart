import 'package:first_flutter_project/models/film.dart';
import 'package:first_flutter_project/services/film_service.dart';
import 'package:first_flutter_project/widgets/card_film.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final filmService = FilmService();
  late List<Film> _films = [];

  @override
  void initState() {
    super.initState();
    //_films= await filmService.fetchFilms();
    _fetchFilms();
  }

  void _fetchFilms() async {
    // Fetch the films asynchronously
    List<Film> films = await filmService.fetchFilms();
    setState(() {
      // Update the UI with the new films
      _films = films;
    });
  }

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'G-Store',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,

          backgroundColor: Colors.black, //add background color black
        ),
        body:  _films.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Show a loading spinner while films are loading
          :ListView.builder(
            itemCount: _films.length,
            itemBuilder: (context, index) {
              return CardFilm(_films[index]);
            })

        /*SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CardFilm(films[0]),
                const SizedBox(height: 10),
                CardFilm(films[1]),
                const SizedBox(height: 10),
                CardFilm(films[2]),
                const SizedBox(height: 10),
                CardFilm(films[3])
              ],
            ),
          ),
        )
    //throw UnimplementedError();*/
        );
  }
}
