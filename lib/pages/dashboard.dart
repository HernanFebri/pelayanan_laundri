import 'package:flutter/material.dart';
import 'package:pelayanan_laundri/pages/beranda_page.dart';
import 'package:pelayanan_laundri/pages/profile_page.dart';
import 'package:pelayanan_laundri/pages/riwayat_page.dart';
import 'package:pelayanan_laundri/utils/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: 30,
            ),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 30,
            ),
            label: 'Profil',
          ),
        ],
        backgroundColor: Constants.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const BerandaPage();
      case 1:
        return const RiwayatPage();
      case 2:
        return const ProfilePage();
      default:
        return const Center(
          child: Text(
            'Page Not Found',
            style: TextStyle(fontSize: 24),
          ),
        );
    }
  }
}
