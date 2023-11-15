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
          childAspectRatio: 0.5,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(items[index]);
        },
      ),
    );
  }
}

...
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
