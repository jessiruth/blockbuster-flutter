class Item {
  String name;
  int amount;
  String description;
  double price;
  int year;
  String genre;
  int duration;
  double rating;
  String image;

  Item({
    required this.name,
    required this.amount,
    required this.description,
    required this.price,
    required this.year,
    required this.genre,
    required this.duration,
    required this.rating,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      amount: json['amount'],
      description: json['description'],
      price: json['price'],
      year: json['year'],
      genre: json['genre'],
      duration: json['duration'],
      rating: json['rating'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount': amount,
        'description': description,
        'price': price,
        'year': year,
        'genre': genre,
        'duration': duration,
        'rating': rating,
        'image': image,
      };
}
