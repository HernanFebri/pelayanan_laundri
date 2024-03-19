import 'package:flutter/material.dart';
import 'package:pelayanan_laundri/pages/tambah_produk.dart';
import 'package:pelayanan_laundri/utils/constants.dart';

class Produk extends StatefulWidget {
  const Produk({Key? key});

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Produk',
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
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 50.0,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              constraints: const BoxConstraints.expand(height: 50),
              child: const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'KILOAN'),
                  Tab(text: 'SATUAN'),
                  Tab(text: 'PARFUM'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        'KILOAN',
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text('SATUAN'),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text('PARFUM'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(77, 62, 147, 50),
        onPressed: () {
          // Tambahkan aksi yang ingin Anda lakukan ketika tombol ditekan
          // Misalnya, menambahkan produk baru
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TambahProduk(),
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
