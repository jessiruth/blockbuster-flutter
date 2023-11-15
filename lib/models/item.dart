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

List<Item> items = [
  Item(
    name: "Ponyo",
    amount: 10,
    description:
        "The son of a sailor, 5-year-old Sosuke lives a quiet life on an oceanside cliff with his mother Lisa. One fateful day, he finds a beautiful goldfish trapped in a bottle on the beach and upon rescuing her, names her Ponyo. But she is no ordinary goldfish. The daughter of a masterful wizard and a sea goddess, Ponyo uses her father's magic to transform herself into a young girl and quickly falls in love with Sosuke, but the use of such powerful sorcery causes a dangerous imbalance in the world. As the moon steadily draws nearer to the earth and Ponyo's father sends the ocean's mighty waves to find his daughter, the two children embark on an adventure of a lifetime to save the world and fulfill Ponyo's dreams of becoming human.",
    price: 10000,
    year: 2008,
    genre: "Animation",
    duration: 101,
    rating: 7.7,
    image: "assets/images/Ponyo_(2008).png",
  ),
  Item(
    name: "Kiki's Delivery Service",
    amount: 5,
    description:
        "This is the story of a young witch, named Kiki who is now 13 years old. But she is still a little green and plenty headstrong, but also resourceful, imaginative, and determined. With her trusty wisp of a talking cat named Jiji by her side she's ready to take on the world, or at least the quaintly European seaside village she's chosen as her new home.",
    price: 35000,
    year: 1989,
    genre: "Fantasy",
    duration: 103,
    rating: 7.8,
    image: "assets/images/Kiki's_Delivery_Service_(1989).jpg",
  ),
  Item(
    name: "My Neighbor Totoro",
    amount: 16,
    description:
        "Two young girls, 10-year-old Satsuki and her 4-year-old sister Mei, move into a house in the country with their father to be closer to their hospitalized mother. Satsuki and Mei discover that the nearby forest is inhabited by magical creatures called Totoros (pronounced toe-toe-ro). They soon befriend these Totoros, and have several magical adventures.",
    price: 45250,
    year: 1988,
    genre: "Comedy",
    duration: 86,
    rating: 8.2,
    image: "assets/images/My_Neighbour_Totoro_(1988).jpg",
  )
];
