class Film {
  final String title;
  final String image;
  final String description;
  final String price;

  Film({required this.title, required this.image,required this.description, required this.price});

  // From JSON
  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
        title: json['title'], image: json['image'],description: json['description'], price: json['price']);
  }

  // To JSON
  Map<String, dynamic> toJson() =>
      {'title': title, 'image': image, 'description': description, 'price': price};
}
