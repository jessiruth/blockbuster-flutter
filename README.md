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