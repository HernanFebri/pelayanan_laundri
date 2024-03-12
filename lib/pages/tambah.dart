import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pelayanan_laundri/utils/constants.dart';

class Tambah extends StatefulWidget {
  const Tambah({Key? key}) : super(key: key);

  @override
  State<Tambah> createState() => _TambahState();
}

class _TambahState extends State<Tambah> {
  List<String> dataList = []; // List untuk menyimpan data
  List<String> filteredDataList = []; // List untuk menyimpan data yang difilter

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();
  final TextEditingController _jenisParfumController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  late DateTime _selectedDate;
  String _selectedLaundryType = 'Reguller CKS'; // Default jenis laundry

  final Map<String, Map<String, int>> _laundryPrices = {
    'Reguller CKS': {
      '3 hari': 5000,
      '2 hari': 6000,
      '1 hari': 7000,
      '12 jam': 10000,
      '9 jam': 12000,
      '6 jam': 15000,
      '3 jam': 20000,
    },
    'Reguller CKL': {
      '2 hari': 4000,
      '1 hari': 5000,
      '12 jam': 6000,
      '6 jam': 8000,
      '3 jam': 10000,
    },
    'Reguller Setrika': {
      '2 hari': 4000,
      '1 hari': 5000,
      '12 jam': 6000,
      '6 jam': 8000,
      '3 jam': 10000,
    },
    'Cuci Satuan': {
      'Bed cover kecil': 15000,
      'Bed cover sedang': 20000,
      'Selimut kecil': 10000,
      'Selimut sedang': 15000,
    },
  };

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    filteredDataList =
        dataList; // Menginisialisasi filteredDataList dengan dataList
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Data Pelanggan'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Cari',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  filteredDataList = dataList
                      .where((data) =>
                          data.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredDataList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      hapusData(
                          index); // Panggil fungsi hapusData saat tombol hapus ditekan
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                child: AlertDialog(
                  title: Text('Tambah Data'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama Pelanggan',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      TextField(
                        controller: _nomorController,
                        decoration: InputDecoration(
                          labelText: 'Nomor Telepon',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType:
                            TextInputType.phone, // Tipe keyboard nomor telepon
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // Hanya memperbolehkan angka
                        ],
                      ),
                      ListTile(
                        title: Text(
                            "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}"),
                        onTap: () {
                          _pilihTanggal(context);
                        },
                        leading: Icon(Icons.calendar_today),
                      ),
                      DropdownButtonFormField<String>(
                        value: _selectedLaundryType,
                        decoration: InputDecoration(
                          labelText: 'Jenis Laundri',
                          prefixIcon: Icon(Icons.local_laundry_service),
                        ),
                        items: _laundryPrices.keys.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedLaundryType = value!;
                          });
                        },
                      ),
                      TextField(
                        controller: _beratController,
                        decoration: InputDecoration(
                          labelText: 'Berat (kg)',
                          prefixIcon: Icon(Icons.scale),
                        ),
                        keyboardType:
                            TextInputType.number, // Tipe keyboard untuk berat
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // Hanya memperbolehkan angka
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        _resetControllers(); // Reset semua controller
                        Navigator.pop(context); // Tutup dialog
                      },
                      child: Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () {
                        tambahData(
                            'Nama: ${_namaController.text}, Nomor: ${_nomorController.text}, Tanggal: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}, Jenis Parfum: ${_jenisParfumController.text}, Jenis Laundri: $_selectedLaundryType, Berat: ${_beratController.text}');
                        // Panggil fungsi tambahData saat tombol tambah ditekan
                        _resetControllers(); // Reset semua controller
                        Navigator.pop(context); // Tutup dialog
                      },
                      child: Text('Tambah'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void tambahData(String newData) {
    setState(() {
      dataList.add(newData); // Tambah data baru ke dalam list
      filteredDataList =
          dataList; // Refresh filteredDataList setelah menambah data baru
    });
  }

  void hapusData(int index) {
    setState(() {
      dataList.removeAt(index); // Hapus data pada indeks tertentu
      filteredDataList.removeAt(index); // Hapus data pada filteredDataList
    });
  }

  void _resetControllers() {
    // Reset semua controller
    _namaController.clear();
    _nomorController.clear();
    _jenisParfumController.clear();
    _beratController.clear();
  }

  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
