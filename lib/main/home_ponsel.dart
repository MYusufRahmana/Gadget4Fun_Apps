import 'package:flutter/material.dart';
import 'package:pab_tean/main/compare_device.dart';
import 'package:pab_tean/main/phone.dart';
import 'package:pab_tean/model/phone_details.dart';
import 'package:pab_tean/sidebar/mydevice.dart';
import 'package:pab_tean/sidebar/profile/profile.dart';
import 'package:pab_tean/main/video_ulasan.dart';
import 'package:pab_tean/main/forum_ulasan.dart';
import 'package:pab_tean/sidebar/settings.dart';

class home_ponsel extends StatelessWidget {
  const home_ponsel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
        'assets/images/phone/LogoGadget.png', // Gantilah dengan path sesuai lokasi logo Anda
        height: 60, // Sesuaikan tinggi logo sesuai kebutuhan
      ),
      centerTitle: true,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PhoneDetailsScreen(details: details);
                  }),
                );
              },
              child: Column(
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
            );
          },
          itemCount: PhoneDetailsList.length,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gadget4Fun',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            //Profile
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profiles'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const profile()),
                );
              },
            ),
            //Settings
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const settings()),
                );
              },
            ),
            //Profile
            ListTile(
              leading: const Icon(Icons.device_unknown_rounded),
              title: const Text('My Device'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDevice()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye_outlined),
            label: 'Forum Ulasan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smartphone),
            label: 'Ponsel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam_sharp),
            label: 'Video Ulasan',
          ),
            BottomNavigationBarItem(
      icon: Icon(Icons.compare), // Icon untuk Compare Device
      label: 'Compare Devices',
    ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.brown,
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              // logika untuk Forum Ulasan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const forum_ulasan()),
              );
              break;
            case 1:
              // logika untuk Video Ulasan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const home_ponsel()),
              );
              break;
            case 2:
              // logika untuk Video Ulasan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const video_ulasan()),
              );
              break;
              case 3: // Handle aksi ketika Compare Devices ditekan
                Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CompareDevice()),
        );
        break;
          }
        },
      ),
    );
  }
}
