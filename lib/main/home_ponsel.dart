import 'package:flutter/material.dart';
import 'package:pab_tean/main/compare_device.dart';
import 'package:pab_tean/main/phone.dart';
import 'package:pab_tean/model/phone_details.dart';
import 'package:pab_tean/main/video_ulasan.dart';
import 'package:pab_tean/main/forum_ulasan.dart';
import 'package:pab_tean/sidebar/mydevice.dart';
import 'package:pab_tean/sidebar/profile/profile.dart';
import 'package:pab_tean/sidebar/settings.dart';

class home_ponsel extends StatefulWidget {
  const home_ponsel({Key? key}) : super(key: key);

  @override
  _HomePonselState createState() => _HomePonselState();
}

class _HomePonselState extends State<home_ponsel> {
  late List<PhoneDetails> displayedPhoneList;

  @override
  void initState() {
    super.initState();
    displayedPhoneList = List.from(PhoneDetailsList);
  }

  void searchPhone(String query) {
    setState(() {
      displayedPhoneList = PhoneDetailsList
          .where((phone) => phone.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/phone/LogoGadget.png',
          height: 60,
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            onPressed: () async {
              final String? result = await showSearch(
                context: context,
                delegate: PhoneSearchDelegate(PhoneDetailsList.map((details) => details.name).toList()),
              );
              if (result != null && result.isNotEmpty) {
                searchPhone(result);
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
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
            final PhoneDetails details = displayedPhoneList[index];

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
          itemCount: displayedPhoneList.length,
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
                  MaterialPageRoute(builder: (context) => const Profil()),
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
              title: const Text('Asus Rog Phone 6'),
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
            icon: Icon(Icons.compare),
            label: 'Compare Devices',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.brown,
        currentIndex: 1,
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
            case 3:
              // Handle aksi ketika Compare Devices ditekan
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

class PhoneSearchDelegate extends SearchDelegate<String> {
  final List<String> phoneNames;

  PhoneSearchDelegate(this.phoneNames);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> searchResults = phoneNames
        .where((phone) => phone.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            // Navigasi ke halaman detail handphone sesuai dengan nama yang ditekan
            String selectedPhoneName = searchResults[index];
            PhoneDetails selectedPhone = PhoneDetailsList.firstWhere((phone) => phone.name == selectedPhoneName);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhoneDetailsScreen(details: selectedPhone),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = phoneNames
        .where((phone) => phone.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            // Set query dan close pencarian ketika pengguna memilih salah satu saran
            query = suggestions[index];
            close(context, query);
          },
        );
      },
    );
  }
}
