import 'package:flutter/material.dart';
import 'package:pelayanan_laundri/pages/pelanggan.dart';
import 'package:pelayanan_laundri/pages/produk.dart';
import 'package:pelayanan_laundri/utils/constants.dart';
import 'package:pelayanan_laundri/widgets/card_button.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/frameberanda.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  CardButton(
                    'PRODUK',
                    'assets/images/produk.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Produk(),
                        ),
                      );
                    },
                  ),
                  CardButton(
                    'PELANGGAN',
                    'assets/images/pelanggan.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Pelanggan(),
                        ),
                      );
                    },
                  ),
                  CardButton(
                    'LAPORAN',
                    'assets/images/laporan.png',
                    onPressed: () {},
                  ),
                  CardButton(
                    'TRANSAKSI',
                    'assets/images/transaksi.png',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
