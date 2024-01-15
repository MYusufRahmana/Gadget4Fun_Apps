import 'package:flutter/material.dart';
import 'package:pab_tean/model/phone_details.dart';

class CompareDevice extends StatefulWidget {
  const CompareDevice({Key? key}) : super(key: key);

  @override
  _CompareDeviceState createState() => _CompareDeviceState();
}

class _CompareDeviceState extends State<CompareDevice> {
  List<PhoneDetails> selectedPhones = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bandingkan Ponsel'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
          ),
          itemBuilder: (context, index) {
            final PhoneDetails details = PhoneDetailsList[index];

            return InkWell(
              onTap: () {
                setState(() {
                  // Toggle pemilihan
                  if (selectedPhones.contains(details)) {
                    selectedPhones.remove(details);
                  } else {
                    if (selectedPhones.length < 2) {
                      selectedPhones.add(details);
                    } else {
                      // Tampilkan pesan jika mencoba memilih lebih dari dua handphone
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Anda hanya dapat memilih dua handphone untuk dibandingkan.'),
                        ),
                      );
                    }
                  }
                });
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          details.imageAsset,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          details.name,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: selectedPhones.contains(details)
                            ? Colors.green
                            : Colors.grey,
                        child: selectedPhones.contains(details)
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: PhoneDetailsList.length,
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Logika untuk menangani pemilihan ponsel
          if (selectedPhones.length == 2) {
            // Navigasi ke halaman perbandingan dengan ponsel yang dipilih
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompareResult(selectedPhones: selectedPhones),
              ),
            );
          } else {
            // Tampilkan pesan jika tidak memilih dua handphone
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Pilih dua handphone untuk dibandingkan.'),
              ),
            );
          }
        },
        child: const Text('Bandingkan'),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
      ),
    );
  }
}

class CompareResult extends StatelessWidget {
  final List<PhoneDetails> selectedPhones;

  const CompareResult({Key? key, required this.selectedPhones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Perbandingan'),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var details in selectedPhones.take(2)) // Hanya menampilkan dua handphone
                    Column(
                      children: [
                        Image.asset(
                          details.imageAsset,
                          height: 250,
                          width: 250,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          details.nameDetails,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Tampilkan spesifikasi di bawah gambar
                        const Divider(),
                        _buildSpecification('Tahun Rilis', details.Tahunrilis),
                        _buildSpecification('Jaringan', details.Jaringan),
                        _buildSpecification('Sim Card', details.SimCard),
                        _buildSpecification('Body Dimensi', details.bodyDimensi),
                        _buildSpecification('Body Berat', details.bodyBerat),
                        _buildSpecification('RAM', details.ram),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecification(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
