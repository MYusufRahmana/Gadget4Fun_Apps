import 'package:flutter/material.dart';
import 'package:pab_tean/main/home_ponsel.dart';

class MyDevice extends StatelessWidget {
  const MyDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Asus Rog Phone 6',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home_ponsel()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/images/phone/Rog-Phone-6.png', // Ganti dengan path gambar handphone Anda
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Asus ROG Phone 6',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSpecItem('Tahun Rilis', '2022 July 13'),
            _buildSpecItem('Jaringan', '2G, 3G, 4G, 5G'),
            _buildSpecItem('Sim Card', 'Dual Sim'),
            _buildSpecItem('eSim', 'Ya'),
            _buildSpecItem('Dimensi', '174 x 77 x 10.3 mm'),
            _buildSpecItem('Berat', '239 g'),
            _buildSpecItem('Body Material', 'AMOLED'),
            _buildSpecItem('Camera', '50 MP'),
            _buildSpecItem('Battery', '6000 mAh, Li-Po'),
            // Tambahkan item spesifikasi lainnya sesuai kebutuhan
            // ...
          ],
        ),
      ),
    );
  }

  Widget _buildSpecItem(String title, String value) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(value),
    );
  }
}
