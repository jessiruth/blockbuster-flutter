# Blockbuster Flutter
Blockbuster merupakan aplikasi yang digunakan untuk memanajemen data film. Aplikasi ini dibuat menggunakan bahasa pemrograman Dart dan menggunakan framework Flutter. Aplikasi ini dibuat untuk memenuhi tugas besar mata kuliah Pemrograman Berbasis Platform yang diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia.

## Author
- Nama: Jessica Ruth Damai Yanti Manurung
- NPM: 2206082783
- Kelas: Pemrograman Berbasis Platform C

# Tugas 7: Elemen Dasar Flutter

## *Step-by-step* Pembuatan Aplikasi

### 1. Membuat *project* Flutter
Pertama, saya membuat *project* Flutter dengan nama `blockbuster` dengan menggunakan *command* `flutter create blockbuster`.

### 2. Merapihkan Struktur Proyek
Kemudian, saya merapihkan struktur proyek dengan memisahkan menu dari *file* `main.dart` ke *file* `menu.dart` sehingga *file* `main.dart` hanya berisi *code* untuk menjalankan aplikasi saja. Berikut adalah *code* untuk *file* `main.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:blockbuster/menu.dart';

void main() {
  runApp(const BlockbusterApp());
}

class BlockbusterApp extends StatelessWidget {
  const BlockbusterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blockbuster',
      theme: ThemeData(
        primaryColor: const Color(0xFFF2BED1),
        scaffoldBackgroundColor: const Color(0xFFF8E8EE),
        useMaterial3: true,
      ),
      home: Menu(),
    );
  }
}
```

### 3. Membuat 3 tombol menu sederhana
Kemudian, saya membuat 3 tombol menu untuk melihat daftar item (Lihat Item), menambahkan item (Tambah Item), dan logout (Logout). Berikut adalah *code* untuk *file* `menu.dart`:
```dart
import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;

  MenuItem(this.name, this.icon);
}

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  final List<MenuItem> menuItems = [
    MenuItem('Lihat Item', Icons.checklist),
    MenuItem('Tambah Item', Icons.add_circle),
    MenuItem('Logout', Icons.logout),
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
                    color: const Color(0xFFF2BED1),
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

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### 4. Memunculkan `SnackBar` ketika tombol menu ditekan
Kemudian, saya menambahkan `SnackBar` yang akan muncul ketika tombol menu ditekan. Berikut adalah *code* untuk *file* `menu.dart`:
```dart
...
class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  "Kamu telah menekan tombol ${item.name}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
...
```

### 5. Mengimplementasikan warna-warna yang berbeda untuk setiap menu
Kemudian, saya mengimplementasikan warna-warna yang berbeda untuk setiap menu. Berikut adalah *code* untuk *file* `menu.dart`:
```dart
import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  MenuItem(this.name, this.icon, this.color);
}

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

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  "Kamu telah menekan tombol ${item.name}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                backgroundColor: item.color,
              ),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Menjawab Pertanyaan-Pertanyaan
### 1. Apa perbedaan utama antara _stateless_ dan _stateful widget_ dalam konteks pengembangan aplikasi Flutter?
Perbedaan utama antara _stateless_ dan _stateful widget_ adalah bahwa _stateless widget_ tidak dapat berubah sedangkan _stateful widget_ dapat berubah. _Stateless widget_ tidak dapat berubah karena tidak memiliki _state_ sedangkan _stateful widget_ dapat berubah karena memiliki _state_. _State_ adalah data yang dapat berubah di dalam aplikasi. _Stateless widget_ tidak dapat berubah karena tidak memiliki _state_ sehingga tidak dapat mengubah data yang ada di dalam aplikasi. _Stateful widget_ dapat berubah karena memiliki _state_ sehingga dapat mengubah data yang ada di dalam aplikasi.

### 2. Sebutkan seluruh _widget_ yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
Berikut adalah seluruh _widget_ yang saya gunakan untuk menyelesaikan tugas ini:
- `Scaffold` adalah _widget_ yang digunakan untuk membuat tampilan dasar aplikasi. `Scaffold` memiliki beberapa properti seperti `appBar` untuk menambahkan _app bar_ di atas aplikasi, `body` untuk menambahkan _widget_ di dalam aplikasi, dan `floatingActionButton` untuk menambahkan _floating action button_ di bawah aplikasi.
- `AppBar` adalah _widget_ yang digunakan untuk membuat _app bar_ di atas aplikasi. `AppBar` memiliki beberapa properti seperti `title` untuk menambahkan judul di dalam _app bar_, `backgroundColor` untuk menambahkan warna latar belakang di dalam _app bar_, dan `foreground` untuk menambahkan warna teks di dalam _app bar_.
- `ScaffoldMessenger` adalah _widget_ yang digunakan untuk menampilkan `SnackBar` di dalam aplikasi. `ScaffoldMessenger` memiliki beberapa properti seperti `hideCurrentSnackBar` untuk menyembunyikan `SnackBar` yang sedang ditampilkan, `showSnackBar` untuk menampilkan `SnackBar` di dalam aplikasi, dan `ScaffoldMessenger.of(context)` untuk mendapatkan `ScaffoldMessenger` dari `context`.
- `SnackBar` adalah _widget_ yang digunakan untuk menampilkan pesan singkat di dalam aplikasi. `SnackBar` memiliki beberapa properti seperti `content` untuk menambahkan isi pesan di dalam `SnackBar` dan `backgroundColor` untuk menambahkan warna latar belakang di dalam `SnackBar`.
- `SingleChildScrollView` adalah _widget_ yang digunakan untuk membuat _scrollable widget_. `SingleChildScrollView` memiliki beberapa properti seperti `child` untuk menambahkan _widget_ di dalam `SingleChildScrollView`.


# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

## *Step-by-step* Implementasi Aplikasi

### 0. Refaktor *code* untuk *file* `menu.dart`
Pertama, saya merapikan *code* untuk *file* `menu.dart` dengan memisahkan *widget* `MenuCard` dan `MenuItem` ke *file* `menu_item.dart`. Berikut adalah *code* untuk *file* `menu.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:blockbuster/menu_item.dart';

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

```
dan berikut adalah *code* untuk *file* `menu_item.dart`:
```dart
import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  MenuItem(this.name, this.icon, this.color);
}

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  "Kamu telah menekan tombol ${item.name}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                backgroundColor: item.color,
              ),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
Lalu saya membuat 2 folder baru bernama `screens` dan `widgets` untuk menyimpan *file* `menu.dart` dan `menu_item.dart`. Berikut adalah struktur proyek setelah saya merapikan *code* untuk *file* `menu.dart`:
```
blockbuster/
  ...
  lib/
    screens/
      menu.dart
    widgets/
      menu_item.dart
    main.dart
  ...
```

### 1. Membuat *model* untuk item
Selanjutnya, saya membuat *model* untuk item. Berikut adalah *code* untuk *file* `models/item.dart`:
```dart
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
```

### 2. Membuat form untuk menambahkan item
Selanjutnya, saya membuat form untuk menambahkan item. Berikut adalah *code* untuk *file* `screens/add_item.dart`:
```dart
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:blockbuster/models/item.dart';
import 'package:blockbuster/widgets/left_drawer.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  var _item = Item(
    name: '',
    amount: 0,
    description: '',
    price: 0,
    year: 0,
    genre: '',
    duration: 0,
    rating: 0,
    image: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Item'),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: const LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ponyo',
                      labelText: 'Nama Film',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama film tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '10',
                      labelText: 'Jumlah',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.amount = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Jumlah tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText:
                          "The son of a sailor, 5-year-old Sosuke lives a quiet life on an oceanside cliff with his mother Lisa. One fateful day, he finds a beautiful goldfish trapped in a bottle on the beach and upon rescuing her, names her Ponyo. But she is no ordinary goldfish. The daughter of a masterful wizard and a sea goddess, Ponyo uses her father's magic to transform herself into a young girl and quickly falls in love with Sosuke, but the use of such powerful sorcery causes a dangerous imbalance in the world. As the moon steadily draws nearer to the earth and Ponyo's father sends the ocean's mighty waves to find his daughter, the two children embark on an adventure of a lifetime to save the world and fulfill Ponyo's dreams of becoming human.",
                      labelText: 'Deskripsi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '10000',
                      labelText: 'Harga',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.price = double.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Harga tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '2008',
                      labelText: 'Tahun',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.year = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Tahun tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Animation',
                      labelText: 'Genre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.genre = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Genre tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '101',
                      labelText: 'Durasi (menit)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.duration = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Durasi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: '7.7',
                      labelText: 'Rating',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.rating = double.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Rating tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white),
                    // Add Image
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _item.image = image!.path;
                      });
                    },
                    child: const Text('Upload Image'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: _item.image == ''
                          ? const Text('No image selected.')
                          : Image.file(File(_item.image)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              _item.image != '') {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title:
                                      const Text('Film berhasil ditambahkan'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.file(File(_item.image)),
                                        Text("Name: ${_item.name}"),
                                        Text("Amount: ${_item.amount}"),
                                        Text("Price: ${_item.price}"),
                                        Text("Year: ${_item.year}"),
                                        Text("Genre: ${_item.genre}"),
                                        Text("Duration: ${_item.duration}"),
                                        Text("Rating: ${_item.rating}"),
                                        Text(
                                            "Description: ${_item.description}"),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                            _formKey.currentState!.reset();
                            _item.image = '';
                          }
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

```
Lalu saya menambahkan *route* untuk *screen* `AddItem` di *file* `menu_item.dart` agar ketika tombol `Tambah Item` ditekan, maka *screen* `AddItem` akan ditampilkan. Berikut adalah *code* untuk *file* `menu_item.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:blockbuster/screens/add_item.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  MenuItem(this.name, this.icon, this.color);
}

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  "Kamu telah menekan tombol ${item.name}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                backgroundColor: item.color,
              ),
            );

          // Navigator
          if (item.name == "Tambah Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddItem()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

### 3. Membuat *drawer* untuk melihat daftar menu
Selanjutnya, saya membuat *drawer* untuk melihat daftar menu. Berikut adalah *code* untuk *file* `widgets/left_drawer.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:blockbuster/screens/menu.dart';
import 'package:blockbuster/screens/add_item.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddItem()),
                );
              },
            ),
          ],
        ));
  }
}

```
Selanjutnya saya menambahkan *drawer* ke *file* `menu.dart` dan `add_item.dart` dengan menambahkan kode `drawer: const LeftDrawer(),` di dalam *widget* `Scaffold`.

### 4. Membuat *screen* untuk melihat daftar item
Sebelum membuat *screen* untuk melihat daftar item, saya menambahkan variabel `items` di *file* `item.dart` untuk menyimpan daftar item semetara. Berikut adalah *code* untuk *file* `item.dart`:
```dart
// menambahkan dummy data
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
    image: "assets/images/My_Neighbor_Totoro_(1988).jpg",
  )
];
```
> Assets yang digunakan diimport ke dalam *file* `pubspec.yaml`

Selanjutnya, saya membuat *widget* `ItemCard` untuk menampilkan item. Berikut adalah *code* untuk *file* `widgets/item_card.dart`:
```dart
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                "Rp ${item.price} - ${item.amount} pcs left",
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

```
Lalu saya membuat *screen* `ItemList` untuk menampilkan daftar item. Berikut adalah *code* untuk *file* `screens/item_list.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:blockbuster/models/item.dart';
import 'package:blockbuster/widgets/item_card.dart';
import 'package:blockbuster/widgets/left_drawer.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;

  const ItemList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftDrawer(),
      appBar: AppBar(
        title: const Text('Blockbuster'),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.45
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(items[index]);
        },
      ),
    );
  }
}

```
Saya juga menambahkan *route* untuk *screen* `ItemList` di *file* `left_drawer.dart` agar ketika tombol `Lihat Item` ditekan, maka *screen* `ItemList` akan ditampilkan. Berikut adalah *code* untuk *file* `left_drawer.dart`:
```dart
...
import 'package:blockbuster/models/item.dart';
import 'package:blockbuster/screens/item_list.dart';

... // Menambahkan ListTile
ListTile(
  leading: const Icon(Icons.checklist),
  iconColor: Colors.white,
  title: const Text('Lihat Item'),
  textColor: Colors.white,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemList(items: items)),
    );
  },
),

...
```
## Menjawab Pertanyaan-Pertanyaan
### 1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
Perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` adalah `Navigator.push()` menambahkan *screen* baru ke dalam *stack* sedangkan `Navigator.pushReplacement()` mengganti *screen* yang sedang ditampilkan dengan *screen* baru. Berikut adalah contoh penggunaan kedua metode tersebut:
```dart
// Navigator.push()
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ItemList(items: items)),
);

// Navigator.pushReplacement()
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => Menu()),
);
```

### 2. Jelaskan masing-masing *layout widget* pada Flutter dan konteks penggunaannya masing-masing!
Berikut adalah masing-masing *layout widget* pada Flutter dan konteks penggunaannya masing-masing:
1. `Container` adalah *widget* yang digunakan untuk membuat kotak di dalam aplikasi. `Container` dapat mengatur ukuran, warna, dan margin dari kotak yang dibuat. `Container` dapat digunakan sebagai dasar untuk membuat *widget* lain seperti `Row`, `Column`, dan `ListView`.
2. `Row` adalah *widget* yang digunakan untuk membuat baris di dalam aplikasi. `Row` dapat mengatur posisi dan ukuran dari *widget* yang ada di dalamnya. `Row` dapat digunakan untuk menampilkan beberapa *widget* secara horizontal.
3. `Column` adalah *widget* yang digunakan untuk membuat kolom di dalam aplikasi. `Column` dapat mengatur posisi dan ukuran dari *widget* yang ada di dalamnya. `Column` dapat digunakan untuk menampilkan beberapa *widget* secara vertikal.
4. `ListView` adalah *widget* yang digunakan untuk membuat daftar di dalam aplikasi. `ListView` dapat mengatur posisi dan ukuran dari *widget* yang ada di dalamnya. `ListView` dapat digunakan untuk menampilkan daftar *widget* secara vertikal dengan *scrolling*.
5. `GridView` adalah *widget* yang digunakan untuk membuat daftar di dalam aplikasi seperti *grid*. `GridView` dapat mengatur posisi dan ukuran dari *widget* yang ada di dalamnya. `GridView` dapat digunakan untuk menampilkan daftar *widget* secara horizontal dan vertikal dengan *scrolling*.
6. `Stack` adalah *widget* yang digunakan untuk membuat tumpukan di dalam aplikasi. `Stack` dapat mengatur posisi dan ukuran dari *widget* yang ada di dalamnya. `Stack` dapat digunakan untuk menampilkan beberapa *widget* secara bersamaan.

### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Berikut adalah elemen input pada form yang saya pakai pada tugas kali ini:
1. `TextFormField` adalah *widget* yang digunakan untuk membuat *text field* di dalam aplikasi. Saya menggunakan `TextFormField` karena `TextFormField` dapat digunakan untuk membuat *text field* yang dapat menerima input dari pengguna dan dapat melakukan validasi terhadap input yang diberikan.
2. `ImagePicker` adalah *widget* yang digunakan untuk membuat *image picker* di dalam aplikasi. Saya menggunakan `ImagePicker` karena `ImagePicker` dapat digunakan untuk menerima input dari pengguna berupa gambar.

### 4. Bagaimana penerapan *clean architecture* pada aplikasi Flutter?
Penerapan *clean architecture* pada aplikasi Flutter adalah dengan memisahkan *code* menjadi 3 bagian yaitu *presentation*, *domain*, dan *data*. *Presentation* adalah bagian yang berisi *code* untuk menampilkan *widget* di dalam aplikasi. *Domain* adalah bagian yang berisi *code* untuk mengatur *business logic* di dalam aplikasi. *Data* adalah bagian yang berisi *code* untuk mengatur data di dalam aplikasi. Berikut adalah struktur proyek setelah saya menerapkan *clean architecture* pada aplikasi Flutter:
```
blockbuster/
  ...
  lib/
    models/
      item.dart
    screens/
      add_item.dart
      item_list.dart
      menu.dart
    widgets/
      item_card.dart
      left_drawer.dart
      menu_item.dart
    main.dart
  ...
```


# Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

## *Step-by-step* Integrasi Layanan Web Django dengan Aplikasi Flutter

### 0. Mengkonfigurasi Web Django untuk autentikasi dan membuat item flutter
Sebelum mengintegrasikan layanan web Django dengan aplikasi Flutter, saya mengkonfigurasi web Django untuk autentikasi dan membuat item Flutter dengan cara:
1. Membuat `app` baru untuk autentikasi
2. Menginstall `django-cors-headers` untuk mengaktifkan *cross-origin resource sharing*
3. Membuat view untuk autentikasi seperti `login`, `logout`, dan `register`
4. Membuat view untuk membuat item
5. Menambahkan *url* untuk autentikasi dan membuat item

### 1. Menginstall `provider`, `http`, dan `pbp_django_auth` pada aplikasi Flutter
Selanjutnya, saya menginstall `provider`, `http`, dan `pbp_django_auth` pada aplikasi Flutter dengan menjalankan perintah `flutter pub add provider http pbp_django_auth` di dalam terminal.

### 2. Menambahkan `CookieRequest` pada `main.dart`
Selanjutnya, saya menambahkan `CookieRequest` pada `main.dart`. `CookieRequest` digunakan untuk mengirimkan *request* ke web Django dengan *cookie* yang diperlukan untuk autentikasi. Berikut adalah *code* untuk *file* `main.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:blockbuster/screens/menu.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const BlockbusterApp());
}

class BlockbusterApp extends StatelessWidget {
  const BlockbusterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Blockbuster',
        theme: ThemeData(
          primaryColor: const Color(0xFFF2BED1),
          scaffoldBackgroundColor: const Color(0xFFF8E8EE),
          useMaterial3: true,
        ),
        home: Menu(),
      ),
    );
  }
}

```

### 3. Membuat *Login Screen*
Selanjutnya, saya membuat *Login Screen* dengan cara membuat *file* `login.dart` di dalam folder `screens`. Berikut adalah *code* untuk *file* `login.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:blockbuster/screens/menu.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Blockbuster',
        theme: ThemeData(
          primaryColor: const Color(0xFFF2BED1),
          scaffoldBackgroundColor: const Color(0xFFF8E8EE),
          useMaterial3: true,
        ),
        home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final request = Provider.of<CookieRequest>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                final response = await request.login(
                    "https://jess-blockbuster.adaptable.app/auth/login", {
                  "username": username,
                  "password": password,
                });

                if (request.loggedIn) {
                  String message = response["message"];
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Menu()));
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        duration: const Duration(seconds: 1),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Login Failed"),
                      content: Text(response["message"]),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white, // Specify font color
                  fontSize: 16.0, // Increase font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

### 4. Membuat *Register Screen*
Selanjutnya, saya membuat *Register Screen* dengan cara membuat *file* `register.dart` di dalam folder `screens`. Berikut adalah *code* untuk *file* `register.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:blockbuster/screens/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  bool _obscureText = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    final request = Provider.of<CookieRequest>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            TextField(
              controller: _password2Controller,
              obscureText: _obscureText2,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText2 ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText2 = !_obscureText2;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                'Sudah punya akun? Login',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;
                String password2 = _password2Controller.text;

                final response = await request.post(
                    "https://jess-blockbuster.adaptable.app/auth/register", {
                  "username": username,
                  "password": password,
                  "password2": password2,
                });

                if (response["status"]) {
                  String message = response["message"];
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    );
                } else {
                  String message = response["message"];
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    );
                }
              },
              child: const Text('Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

```
Setelah itu, saya mengubah *file* `login.dart` dengan menambahkan *button* untuk menuju *screen* `RegisterPage`. Berikut adalah *code* untuk *file* `login.dart`:
```dart
import 'package:blockbuster/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:blockbuster/screens/menu.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Blockbuster',
        theme: ThemeData(
          primaryColor: const Color(0xFFF2BED1),
          scaffoldBackgroundColor: const Color(0xFFF8E8EE),
          useMaterial3: true,
        ),
        home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final request = Provider.of<CookieRequest>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
              },
              child: const Text(
                'Belum punya akun? Daftar disini',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                final response = await request.login(
                    "https://jess-blockbuster.adaptable.app/auth/login", {
                  "username": username,
                  "password": password,
                });

                if (request.loggedIn) {
                  String message = response["message"];
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Menu()));
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        duration: const Duration(seconds: 1),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Login Failed"),
                      content: Text(response["message"]),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white, // Specify font color
                  fontSize: 16.0, // Increase font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

### 5. Membuat tombol `Logout` pada *screen* `Menu`
Selanjutnya, saya menambahkan fungsi pada tombol `Logout` pada *screen* `Menu` dengan cara menambahkan *code* berikut pada *file* `menu.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:blockbuster/models/item.dart';
import 'package:blockbuster/screens/add_item.dart';
import 'package:blockbuster/screens/item_list.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:blockbuster/screens/login.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  MenuItem(this.name, this.icon, this.color);
}

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () async {
          // Navigator
          if (item.name == "Tambah Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddItem()),
            );
          }
          if (item.name == "Lihat Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ItemList(items: items)),
            );
          }
          if (item.name == "Logout") {
            final response = await request
                .logout("https://jess-blockbuster.adaptable.app/auth/logout");
            if (response["status"]) {
              String message = response["message"];
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                );
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Logout Failed"),
                  content: Text(response["message"]),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

### 6. Mengubah model `Item` pada aplikasi Flutter
Selanjutnya, saya mengubah model `Item` pada aplikasi Flutter dengan hasil convert dari situs [quicktype.io](https://app.quicktype.io/). Berikut adalah *code* untuk *file* `item.dart`:
```dart
// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int amount;
    String description;
    int price;
    int year;
    String genre;
    int duration;
    double rating;
    String image;
    int user;

    Fields({
        required this.name,
        required this.amount,
        required this.description,
        required this.price,
        required this.year,
        required this.genre,
        required this.duration,
        required this.rating,
        required this.image,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        price: json["price"],
        year: json["year"],
        genre: json["genre"],
        duration: json["duration"],
        rating: json["rating"]?.toDouble(),
        image: json["image"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "description": description,
        "price": price,
        "year": year,
        "genre": genre,
        "duration": duration,
        "rating": rating,
        "image": image,
        "user": user,
    };
}

```

### 7. Mengubah *screen* `AddItem` pada aplikasi Flutter
Selanjutnya, saya mengubah *screen* `AddItem` pada aplikasi Flutter dengan cara mengubah *code* pada *file* `add_item.dart`. Berikut adalah *code* untuk *file* `add_item.dart`:
```dart
import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:blockbuster/models/item.dart';
import 'package:blockbuster/widgets/left_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  var _item = Fields(
    name: '',
    amount: 0,
    description: '',
    price: 0,
    year: 0,
    genre: '',
    duration: 0,
    rating: 0,
    image: '',
    user: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Item'),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: const LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ponyo',
                      labelText: 'Nama Film',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama film tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '10',
                      labelText: 'Jumlah',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.amount = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Jumlah tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText:
                          "The son of a sailor, 5-year-old Sosuke lives a quiet life on an oceanside cliff with his mother Lisa. One fateful day, he finds a beautiful goldfish trapped in a bottle on the beach and upon rescuing her, names her Ponyo. But she is no ordinary goldfish. The daughter of a masterful wizard and a sea goddess, Ponyo uses her father's magic to transform herself into a young girl and quickly falls in love with Sosuke, but the use of such powerful sorcery causes a dangerous imbalance in the world. As the moon steadily draws nearer to the earth and Ponyo's father sends the ocean's mighty waves to find his daughter, the two children embark on an adventure of a lifetime to save the world and fulfill Ponyo's dreams of becoming human.",
                      labelText: 'Deskripsi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '10000',
                      labelText: 'Harga',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.price = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Harga tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '2008',
                      labelText: 'Tahun',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.year = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Tahun tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Animation',
                      labelText: 'Genre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.genre = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Genre tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '101',
                      labelText: 'Durasi (menit)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.duration = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Durasi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: '7.7',
                      labelText: 'Rating',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _item.rating = double.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Rating tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white),
                    // Add Image
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _item.image = image!.path;
                      });
                    },
                    child: const Text('Upload Image'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: _item.image == ''
                          ? const Text('No image selected.')
                          : Image.file(File(_item.image)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white),
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              _item.image != '') {
                            var image = File(_item.image);
                            var url =
                                "https://jess-blockbuster.adaptable.app/create-flutter/";
                            var request =
                                http.MultipartRequest('POST', Uri.parse(url));
                            final cookieRequest = Provider.of<CookieRequest>(
                                context,
                                listen: false);
                            request.headers.addAll(cookieRequest.headers);
                            request.fields['name'] = _item.name;
                            request.fields['amount'] = _item.amount.toString();
                            request.fields['description'] = _item.description;
                            request.fields['price'] = _item.price.toString();
                            request.fields['year'] = _item.year.toString();
                            request.fields['genre'] = _item.genre;
                            request.fields['duration'] =
                                _item.duration.toString();
                            request.fields['rating'] = _item.rating.toString();
                            request.files.add(await http.MultipartFile.fromPath(
                                'image', _item.image));
                            var response = await http.Response.fromStream(
                                await request.send());
                            var status = jsonDecode(response.body)['status'];
                            if (status) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title:
                                        const Text('Film berhasil ditambahkan'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.file(
                                            image,
                                            fit: BoxFit.cover,
                                          ),
                                          Text("Name: ${_item.name}"),
                                          Text("Amount: ${_item.amount}"),
                                          Text("Price: ${_item.price}"),
                                          Text("Year: ${_item.year}"),
                                          Text("Genre: ${_item.genre}"),
                                          Text("Duration: ${_item.duration}"),
                                          Text("Rating: ${_item.rating}"),
                                          Text(
                                              "Description: ${_item.description}"),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              _formKey.currentState!.reset();
                              setState(() {
                                _item.image = '';
                              });
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Film gagal ditambahkan'),
                                    content: SingleChildScrollView(
                                      child: Text(
                                          jsonDecode(response.body)['message']),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

```

### 8. Mengubah *screen* `ItemList` pada aplikasi Flutter
Selanjutnya, saya mengubah *screen* `ItemList` pada aplikasi Flutter dengan cara mengubah *code* pada *file* `item_list.dart`. Berikut adalah *code* untuk *file* `item_list.dart`:
```dart
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
          if (snapshot.hasData) {
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
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

```

### 9. Mengubah *widget* `ItemCard` pada aplikasi Flutter
Selanjutnya, saya mengubah *widget* `ItemCard` pada aplikasi Flutter dengan cara mengubah *code* pada *file* `item_card.dart`. Berikut adalah *code* untuk *file* `item_card.dart`:
```dart
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

```

### 10. Mengubah *widget* `LeftDrawer` pada aplikasi Flutter
Selanjutnya, saya mengubah *widget* `LeftDrawer` pada aplikasi Flutter dengan cara mengubah *code* pada *file* `left_drawer.dart`. Berikut adalah *code* untuk *file* `left_drawer.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:blockbuster/screens/menu.dart';
import 'package:blockbuster/screens/add_item.dart';
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
                  MaterialPageRoute(builder: (context) => const ItemList()),
                );
              },
            ),
          ],
        ));
  }
}

```

### 11. Mengubah *file* `menu_item.dart` pada aplikasi Flutter
Selanjutnya, saya mengubah *file* `menu_item.dart` pada aplikasi Flutter dengan cara mengubah *code* pada *file* `menu_item.dart`. Berikut adalah *code* untuk *file* `menu_item.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:blockbuster/screens/add_item.dart';
import 'package:blockbuster/screens/item_list.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:blockbuster/screens/login.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  MenuItem(this.name, this.icon, this.color);
}

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () async {
          // Navigator
          if (item.name == "Tambah Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddItem()),
            );
          }
          if (item.name == "Lihat Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ItemList()),
            );
          }
          if (item.name == "Logout") {
            final response = await request
                .logout("https://jess-blockbuster.adaptable.app/auth/logout");
            if (response["status"]) {
              String message = response["message"];
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                );
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Logout Failed"),
                  content: Text(response["message"]),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

Dengan demikian, aplikasi Flutter telah berhasil diubah sehingga dapat berjalan dengan baik.

## Menjawab Pertanyaan
### 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, bisa. Namun, hal tersebut tidak lebih baik daripada membuat model terlebih dahulu karena dengan membuat model terlebih dahulu, kita dapat dengan mudah meng-*convert* data JSON dengan struktur yang kompleks menjadi model yang dapat digunakan pada aplikasi Flutter. Pengambilan data JSON tanpa membuat model terlebih dahulu dapat dilakukan dengan menggunakan *library* `dart:convert` dan *method* `jsonDecode()` dan hal ini akan baik dilakukan jika data JSON yang diambil memiliki struktur yang sederhana.

### 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest merupakan *class* yang digunakan untuk melakukan *request* ke API yang menggunakan *cookie-based authentication*. Instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter karena instance CookieRequest ini akan menyimpan *cookie* yang diberikan oleh API sehingga dapat digunakan untuk melakukan *request* ke API sebagai *user* yang telah *login*.

### 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Pertama, kita membuat model yang sesuai dengan struktur data JSON yang akan diambil. Setelah itu, kita membuat *method* yang akan mengambil data JSON dari API menggunakan *library* `http` dan *method* `get()` atau `post()`. Setelah itu, kita meng-*convert* data JSON yang telah diambil menjadi model yang telah dibuat menggunakan *library* `dart:convert` dan *method* `jsonDecode()`. Setelah itu, kita dapat menampilkan data yang telah di-*convert* menjadi model tersebut pada aplikasi Flutter.

### 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Pertama, kita membuat *method* yang akan mengirimkan data akun yang telah diinput pada aplikasi Flutter ke API menggunakan *library* `pbp_django_auth` dan *method* `login()`. Setelah itu, kita dapat menampilkan menu pada aplikasi Flutter jika proses autentikasi telah selesai dilakukan oleh Django.

### 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
Seluruh widget yang saya pakai pada tugas ini adalah sebagai berikut:
- `AppBar`: digunakan untuk membuat *app bar* pada aplikasi Flutter.
- `Scaffold`: digunakan untuk membuat *scaffold* pada aplikasi Flutter.
- `Drawer`: digunakan untuk membuat *drawer* pada aplikasi Flutter.
- `DrawerHeader`: digunakan untuk membuat *header* pada *drawer*.
- `ListView`: digunakan untuk membuat *list view* pada aplikasi Flutter.
- `ListTile`: digunakan untuk membuat *list tile* pada aplikasi Flutter.
- `Text`: digunakan untuk membuat *text* pada aplikasi Flutter.
- `TextField`: digunakan untuk membuat *text field* pada aplikasi Flutter.
- `TextFormField`: digunakan untuk membuat *text form field* pada aplikasi Flutter.
- `ElevatedButton`: digunakan untuk membuat *elevated button* pada aplikasi Flutter.
- `TextButton`: digunakan untuk membuat *text button* pada aplikasi Flutter.
- `Image`: digunakan untuk membuat *image* pada aplikasi Flutter.
- `Icon`: digunakan untuk membuat *icon* pada aplikasi Flutter.
- `IconButton`: digunakan untuk membuat *icon button* pada aplikasi Flutter.
- `SizedBox`: digunakan untuk membuat *sized box* pada aplikasi Flutter.
- `GridView`: digunakan untuk membuat *grid view* pada aplikasi Flutter.
- `Card`: digunakan untuk membuat *card* pada aplikasi Flutter.
- `InkWell`: digunakan untuk membuat *ink well* pada aplikasi Flutter.
- `Column`: digunakan untuk membuat *column* pada aplikasi Flutter.

dan seterusnya.
