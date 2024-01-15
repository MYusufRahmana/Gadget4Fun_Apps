import 'package:flutter/material.dart';
import 'package:pab_tean/main/compare_device.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pab_tean/model/video_model.dart';
import 'package:pab_tean/sidebar/mydevice.dart';
import 'package:pab_tean/sidebar/profile/profile.dart';
import 'package:pab_tean/main/forum_ulasan.dart';
import 'package:pab_tean/main/home_ponsel.dart';
import 'package:pab_tean/sidebar/settings.dart';

class video_ulasan extends StatelessWidget {
  const video_ulasan({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: video_modelList.length,
          itemBuilder: (context, index) {
            final video_model details = video_modelList[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(details.link)); // Open the YouTube link
                  },
                  child: Image.network(
                    details.imageAsset,
                    fit: BoxFit.cover,
                    width: screenWidth / 1.5,
                    height: screenWidth / 2.5,
                  ),
                ),
                Text(
                  details.name,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  details.user,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
              ],
            );
          },
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
          ), BottomNavigationBarItem(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const forum_ulasan()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const home_ponsel()),
              );
              break;
            case 2:
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
