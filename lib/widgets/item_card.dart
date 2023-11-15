import 'dart:io';
import 'package:flutter/material.dart';
import 'package:blockbuster/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(item.name),
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
                      Text("Price: ${item.price}"),
                      Text("Year: ${item.year}"),
                      Text("Genre: ${item.genre}"),
                      Text("Duration: ${item.duration}"),
                      Text("Rating: ${item.rating}"),
                      Text("Description: ${item.description}"),
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
                      width: double.infinity,
                    )
                  : Image.file(
                      File(item.image),
                      width: double.infinity,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${item.name} (${item.year})",
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                "${item.genre} - ${item.rating}",
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
