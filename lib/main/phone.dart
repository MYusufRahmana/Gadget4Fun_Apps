import 'package:flutter/material.dart';
import 'package:pab_tean/model/phone_details.dart';

class PhoneDetailsScreen extends StatelessWidget {
  final PhoneDetails details;

  const PhoneDetailsScreen({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
        'assets/images/phone/LogoGadget.png', // Gantilah dengan path sesuai lokasi logo Anda
        height: 60, // Sesuaikan tinggi logo sesuai kebutuhan
      ),
      centerTitle: true,
      backgroundColor: Colors.brown,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Text(
                  details.nameDetails,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Spesifikasi",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 69, 69, 69),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 19.0),
              ),
              Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 13.0),
                      ),
                      SizedBox(
                        width: screenWidth * 0.55,
                        child: Image.asset(
                          details.imageAsset,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 3,
                    child: Container(
                      color: Color.fromARGB(255, 233, 233, 233),
                      width: screenWidth * 0.39,
                      height: screenWidth * 0.68,
                      child: Column(
                        children: [
                          // Icon Dan Text 1
                          IconAndText(Icons.data_array_sharp,
                              details.cameraPixels, details.cameraPixels2),
                          // Icon 2
                          IconAndText(Icons.camera, details.cameraMegaPixels,
                              details.cameraperpx),
                          // Icon 3
                          IconAndText(Icons.sd_storage_outlined, details.ram,
                              details.ramtype),
                          // Icon 4
                          IconAndText(Icons.battery_std_rounded,
                              details.battery, details.batterymerk),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "UMUM",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),
              DetailsWidget(context, 'Tahun Rilis', details.Tahunrilis),
              DetailsWidget(context, 'Jaringan', details.Jaringan),
              DetailsWidget(context, 'SIM Card', details.SimCard),
              DetailsWidget(context, 'E-Sim', details.eSim),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "BODY",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),
              DetailsWidget(context, 'Dimensi', details.bodyDimensi),
              DetailsWidget(context, 'Berat', details.bodyBerat),
              DetailsWidget(context, 'Ketahanan', details.bodyKetahanan),
              DetailsWidget(context, 'Fitur Lainnya', details.fiturLainnya),
            ],
          ),
        ),
      ),
    );
  }

  // Buat widget untuk mengambil icon dan text lalu tampilkan
  Widget IconAndText(IconData icon, String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget DetailsWidget(BuildContext context, String label, String value) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              ':   ',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
