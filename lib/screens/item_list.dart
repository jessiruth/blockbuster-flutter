import 'package:flutter/material.dart';
import 'package:blockbuster/models/item.dart';
import 'package:blockbuster/widgets/item_card.dart';
import 'package:blockbuster/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  Future<List<Item>> fetchItems(BuildContext context) async {
    final request = context.watch<CookieRequest>();
    var url = 'https://jess-blockbuster.adaptable.app/get-item-json/';
    var response = await request.get(url);

    List<Item> items = [];
    for (var i in response) {
      if (i != null) {
        Item item = Item.fromJson(i);
        items.add(item);
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftDrawer(),
      appBar: AppBar(
        title: const Text('Blockbuster'),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<List<Item>>(
        future: fetchItems(context),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.45,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ItemCard(snapshot.data![index]);
              },
            );
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'You have no cards',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
