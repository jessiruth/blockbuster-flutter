import 'package:flutter/material.dart';
import 'package:blockbuster/screens/menu.dart';
import 'package:blockbuster/screens/add_item.dart';
import 'package:blockbuster/models/item.dart';
import 'package:blockbuster/screens/item_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.pink[100]!,
        child: ListView(
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Blockbuster',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF2BED1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Your Movie Library',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF2BED1),
                        ),
                      ),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.home),
              iconColor: Colors.white,
              title: const Text('Halaman Utama'),
              textColor: Colors.white,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_circle),
              iconColor: Colors.white,
              title: const Text('Tambah Item'),
              textColor: Colors.white,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AddItem()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist),
              iconColor: Colors.white,
              title: const Text('Lihat Item'),
              textColor: Colors.white,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemList(items: items)),
                );
              },
            ),
          ],
        ));
  }
}
