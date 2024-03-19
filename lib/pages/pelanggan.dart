import 'package:flutter/material.dart';
import 'package:pelayanan_laundri/pages/tambah_pelanggan.dart';
import 'package:pelayanan_laundri/utils/constants.dart';

class Pelanggan extends StatefulWidget {
  const Pelanggan({Key? key}) : super(key: key);

  @override
  State<Pelanggan> createState() => _PelangganState();
}

class _PelangganState extends State<Pelanggan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Pelanggan',
          style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.w600,
              fontFamily: 'FontPoppins'),
        ),
        toolbarHeight: 80,
        leading: IconButton(
          // Menambahkan tombol kembali dengan ikon keyboard arrow left
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 50.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Cari Pelanggan',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Action ketika nilai pencarian berubah
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(), // Ganti dengan konten daftar pelanggan
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(77, 62, 147, 50),
        onPressed: () {
          // Tambahkan aksi yang ingin Anda lakukan ketika tombol ditekan
          // Misalnya, menambahkan produk baru
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TambahPelanggan(),
            ),
          );
        },
        child: Icon(
          // Mengatur warna dan ukuran ikon panah
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        shape: RoundedRectangleBorder(
          // Mengatur floating button menjadi bundar
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
