import 'package:flutter/material.dart';
import 'package:pelayanan_laundri/utils/constants.dart';
import 'package:pelayanan_laundri/widgets/app_button.dart';
import 'package:pelayanan_laundri/widgets/input_widget.dart';

class TambahPelanggan extends StatefulWidget {
  const TambahPelanggan({super.key});

  @override
  State<TambahPelanggan> createState() => _TambahPelangganState();
}

class _TambahPelangganState extends State<TambahPelanggan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Tambah Pelanggan',
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
                topLabel: 'Nama Pelanggan',
                hintText: 'Masukan Nama Anda',
              ),
              const SizedBox(
                height: 10.0,
              ),
              const InputWidget(
                keyboardType: TextInputType.number,
                topLabel: 'Nomor Whatsapp',
                hintText: 'Masukan Nomor Whatsapp',
              ),
              const SizedBox(
                height: 10.0,
              ),
              const InputWidget(
                keyboardType: TextInputType.name,
                topLabel: 'Alamat',
                hintText: 'Masukan Alamat Anda',
              ),
              SizedBox(
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
