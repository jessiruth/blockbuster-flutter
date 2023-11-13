import 'package:flutter/material.dart';
import 'package:blockbuster/widgets/menu_item.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  final List<MenuItem> menuItems = [
    MenuItem('Lihat Item', Icons.checklist, Colors.blue[100]!),
    MenuItem('Tambah Item', Icons.add_circle, Colors.purple[100]!),
    MenuItem('Logout', Icons.logout, Colors.pink[100]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blockbuster'),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF2BED1),
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: menuItems.map((item) {
                  return MenuCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
