import 'package:flutter/material.dart';
import 'package:pelayanan_laundri/utils/constants.dart';
import 'package:pelayanan_laundri/widgets/app_button.dart';
import 'package:pelayanan_laundri/widgets/input_widget.dart';

class TambahProduk extends StatefulWidget {
  const TambahProduk({super.key});

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Tambah Produk',
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
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const InputWidget(
                keyboardType: TextInputType.name,
                topLabel: 'Nama Produk',
                hintText: 'Masukan Nama Produk',
              ),
              const SizedBox(
                height: 10.0,
              ),
              const InputWidget(
                keyboardType: TextInputType.number,
                topLabel: 'Harga',
                hintText: '0',
              ),
              const SizedBox(
                height: 30.0,
              ),
              AppButton(
                  type: ButtonType.PRIMARY, onPressed: () {}, text: 'Simpan')
            ],
          ),
        ),
      ),
    );
  }
}
