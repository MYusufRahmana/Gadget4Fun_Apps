import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pab_tean/model/video_model.dart';
import 'package:pab_tean/sidebar/mydevice.dart';
import 'package:pab_tean/sidebar/profile/profile.dart';
import 'package:pab_tean/main/forum_ulasan.dart';
import 'package:pab_tean/main/home_ponsel.dart';
import 'package:pab_tean/sidebar/settings.dart';
import 'package:pab_tean/main/compare_device.dart';

class VideoSearchDelegate extends SearchDelegate<String> {
  final List<video_model> videoModels;

  VideoSearchDelegate(this.videoModels);

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
    List<video_model> searchResults = videoModels
        .where((video) => video.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].name),
          onTap: () {
            // Launch URL ketika item hasil pencarian dipilih
            launchUrl(Uri.parse(searchResults[index].link));
            // Menutup tampilan pencarian
            close(context, searchResults[index].name);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<video_model> suggestions = videoModels
        .where((video) => video.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].name),
          onTap: () {
            query = suggestions[index].name;
            // Launch URL ketika item saran dipilih
            launchUrl(Uri.parse(suggestions[index].link));
            // Menutup tampilan pencarian
            close(context, suggestions[index].name);
          },
        );
      },
    );
  }
}

class video_ulasan extends StatelessWidget {
  const video_ulasan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                delegate: VideoSearchDelegate(video_modelList),
              );
              if (result != null && result.isNotEmpty) {
                // Implementasi logika ketika hasil pencarian dipilih
                // Misalnya, tindakan khusus atau pindah ke halaman detail video
                // (pemrosesan ini juga dapat diintegrasikan di dalam VideoSearchDelegate)
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DetailVideoPage(videoTitle: result),
                //   ),
                // );
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
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
                    launchUrl(Uri.parse(details.link));
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
                  MaterialPageRoute(builder: (context) => const Profil()),
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
              // Jangan lupa tambahkan logika untuk pindah ke halaman video_ulasan
              break;
            case 3:
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

class DetailVideoPage extends StatelessWidget {
  final String videoTitle;

  const DetailVideoPage({Key? key, required this.videoTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implementasi halaman detail video
    return Scaffold(
      appBar: AppBar(
        title: Text(videoTitle),
      ),
      body: Center(
        child: Text('Detail video untuk $videoTitle'),
      ),
    );
  }
}

void launchUrl(Uri uri) async {
  if (await canLaunch(uri.toString())) {
    await launch(uri.toString());
  } else {
    throw 'Could not launch $uri';
  }
}

void main() {
  runApp(MaterialApp(
    home: video_ulasan(),
  ));
}
