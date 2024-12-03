import 'package:first_flutter_project/models/film.dart';
import 'package:first_flutter_project/screens/cart_screen.dart';
import 'package:first_flutter_project/widgets/card_film.dart';
import 'package:flutter/material.dart';

class GStoreScreen extends StatefulWidget {
  const GStoreScreen({super.key});

  @override
  State<StatefulWidget> createState() => _GStoreScreenState();
}

class _GStoreScreenState extends State<GStoreScreen> {
  final List<Film> films = [
    Film(
        title: "House of Dead",
        image: "HouseOfDead.jpg",
        description: "desc1",
        price: "300"),
    Film(
        title: "Ice Road",
        image: "iceroad.jpg",
        description: "desc2",
        price: "350"),
    Film(
        title: "The Abyss",
        image: "theabyss.jpg",
        description: "desc3",
        price: "200"),
    Film(
        title: "The Grudge",
        image: "thegrudge.jpg",
        description: "desc4",
        price: "300")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'G-Store',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,

          backgroundColor: Colors.black, //add background color black
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white),
              onPressed: () {
                // Add your favorite button logic here
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ));
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: films.length,
            itemBuilder: (context, index) {
              return CardFilm(films[index]);
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
