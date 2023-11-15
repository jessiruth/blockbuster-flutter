import 'dart:io';
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
                  item.name,
                  style: const TextStyle(
                    color: Color(0xFFB0578D),
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      item.image.startsWith('assets')
                          ? Image.asset(
                              item.image,
                            )
                          : Image.file(
                              File(item.image),
                            ),
                      Text("Price: ${item.price}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      Text("Year: ${item.year}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      Text("Genre: ${item.genre}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      Text("Duration: ${item.duration}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      Text("Rating: ${item.rating}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      Text("Description: ${item.description}",
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
              child: item.image.startsWith('assets')
                  ? Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(item.image),
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${item.name} (${item.year})",
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
                "${item.genre} - ${item.rating}",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
