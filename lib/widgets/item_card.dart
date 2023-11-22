import 'package:flutter/material.dart';
import 'package:blockbuster/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF2BED1),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  item.fields.name,
                  style: const TextStyle(
                    color: Color(0xFFB0578D),
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://jess-blockbuster.adaptable.app/media/${item.fields.image}",
                        fit: BoxFit.cover,
                      ),
                      Text("Price: ${item.fields.price}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      Text("Year: ${item.fields.year}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      Text("Genre: ${item.fields.genre}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      Text("Duration: ${item.fields.duration}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      Text("Rating: ${item.fields.rating}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      Text("Description: ${item.fields.description}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Tutup'),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                "https://jess-blockbuster.adaptable.app/media/${item.fields.image}",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${item.fields.name} (${item.fields.year})",
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB0578D),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                "${item.fields.genre} - ${item.fields.rating}",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                "Rp ${item.fields.price} - ${item.fields.amount} pcs left",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
