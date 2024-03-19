import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pelayanan_laundri/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences _prefs;
  late String _userName = 'Nama';
  late String _userRole = 'Jabatan';
  late String _imagePath = ''; // Path untuk foto profil
  bool _prefsLoaded = false;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = _prefs.getString('user_name') ?? _userName;
      _userRole = _prefs.getString('user_role') ?? _userRole;
      _imagePath = _prefs.getString('user_image') ?? '';
      _prefsLoaded = true;
    });
  }

  void _saveProfileData(String name, String role) async {
    await _prefs.setString('user_name', name);
    await _prefs.setString('user_role', role);
    setState(() {
      _userName = name;
      _userRole = role;
    });
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final String imagePath = imageFile.path;
      await _prefs.setString('user_image', imagePath);
      setState(() {
        _imagePath = imagePath;
      });
      Navigator.pop(context);
    }
  }

  void _signOut() async {
    Navigator.pop(context); // Menutup halaman profil setelah keluar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Constants.scaffoldbackgroundColor,
        title: const Text(
          "Profil Saya",
          style: TextStyle(
              fontFamily: 'FontPoppins',
              fontSize: 20.0,
              fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: _prefsLoaded
          ? ListView(
              padding: const EdgeInsets.all(10),
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Constants.primaryColor,
                      radius: 70,
                      backgroundImage: _imagePath.isNotEmpty
                          ? FileImage(File(_imagePath))
                          : const AssetImage('assets/images/logo.png')
                              as ImageProvider,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _userName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(_userRole),
                  ],
                ),
                const SizedBox(height: 35),
                ...List.generate(
                  customListTiles.length,
                  (index) {
                    final tile = customListTiles[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Card(
                        elevation: 2,
                        shadowColor: Colors.black,
                        child: ListTile(
                          tileColor: Constants.scaffoldbackgroundColor,
                          leading: Icon(tile.icon),
                          title: Text(
                            tile.title,
                            style: const TextStyle(color: Colors.black),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            if (index == 0) {
                              // Show bottom sheet for "Ubah Profil"
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  String newName = _userName;
                                  String newRole = _userRole;
                                  return Container(
                                    child: Wrap(
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.edit),
                                          title: const Text('Edit Profil'),
                                          onTap: () async {
                                            final result = await showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                      const Text('Edit Profil'),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      TextFormField(
                                                        initialValue: newName,
                                                        decoration:
                                                            const InputDecoration(
                                                          labelText: 'Nama',
                                                        ),
                                                        onChanged: (value) {
                                                          newName = value;
                                                        },
                                                      ),
                                                      TextFormField(
                                                        initialValue: newRole,
                                                        decoration:
                                                            const InputDecoration(
                                                          labelText: 'Jabatan',
                                                        ),
                                                        onChanged: (value) {
                                                          newRole = value;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context, false);
                                                      },
                                                      child:
                                                          const Text('Batal'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context, true);
                                                      },
                                                      child:
                                                          const Text('Simpan'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (result != null && result) {
                                              _saveProfileData(
                                                  newName, newRole);
                                            }
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading:
                                              const Icon(Icons.photo_library),
                                          title: const Text('Edit Foto Profil'),
                                          onTap: () async {
                                            await _getImage();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else if (index == 1) {
                              // Show bottom sheet for "Tentang Kami"
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    child: const Wrap(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'Purple Clean hadir dengan versi baru yang lebih canggih untuk mempermudah hidup Anda. Dengan desain antarmuka yang lebih intuitif, pilihan layanan yang lebih luas, jadwal penjemputan yang fleksibel, notifikasi langsung, pilihan pembayaran yang aman, dan program loyalitas yang menguntungkan, kami memberikan pengalaman laundry yang menyenangkan dan efisien. Dapatkan keunggulan Purple Clean dalam kualitas terbaik, lingkungan ramah, serta kemudahan dan kepuasan pelanggan. Rasakan perbedaannya sekarang dengan mengunduh aplikasi Purple Clean!',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else if (index == 2) {
                              // Sign out
                              _signOut();
                            }
                          },
                        ),
                      ),
                    );
                  },
                )
              ],
            )
          : const SizedBox(),
    );
  }
}

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.person,
    title: "Ubah Profil",
  ),
  CustomListTile(
    icon: Icons.info,
    title: "Tentang Kami",
  ),
  CustomListTile(
    title: "Keluar",
    icon: CupertinoIcons.arrow_right_arrow_left,
  ),
];
