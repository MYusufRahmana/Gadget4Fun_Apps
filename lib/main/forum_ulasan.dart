import 'package:flutter/material.dart';
import 'package:pab_tean/main/compare_device.dart';
import 'package:pab_tean/model/forum_model.dart';
import 'package:pab_tean/sidebar/mydevice.dart';
import 'package:pab_tean/sidebar/profile/profile.dart';
import 'package:pab_tean/main/video_ulasan.dart';
import 'package:pab_tean/main/home_ponsel.dart';
import 'package:pab_tean/sidebar/settings.dart';
import 'package:pab_tean/main/forum_ulasan_detail.dart';

class forum_ulasan extends StatefulWidget {
  const forum_ulasan({Key? key}) : super(key: key);

  @override
  _forum_ulasanState createState() => _forum_ulasanState();
}

class _forum_ulasanState extends State<forum_ulasan> {
  late List<forum_model> displayedForumList;

  @override
  void initState() {
    super.initState();
    displayedForumList = List.from(forum_modelList);
  }

  void searchForum(String query) {
    setState(() {
      displayedForumList = forum_modelList
          .where((forum) => forum.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
                delegate: ForumSearchDelegate(forum_modelList.map((forum) => forum.name).toList()),
              );
              if (result != null && result.isNotEmpty) {
                searchForum(result);
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: displayedForumList.length,
          itemBuilder: (context, index) {
            final forum_model details = displayedForumList[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForumUlasanDetail(details: details),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.network(
                          details.imageAsset,
                          fit: BoxFit.cover,
                          width: screenWidth / 1,
                          height: screenWidth / 2.3,
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
                        details.Tahun,
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
                  ),
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
            //Profiles
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profiles'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profil()),
                  );
                }),
            //Settings
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const settings()),
                  );
                }),
            //MyDevice
            ListTile(
                leading: const Icon(Icons.device_unknown_rounded),
                title: const Text('Asus Rog Phone 6'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyDevice()),
                  );
                }),
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
        currentIndex: 0,
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

class ForumSearchDelegate extends SearchDelegate<String> {
  final List<String> forumNames;

  ForumSearchDelegate(this.forumNames);

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
    List<String> searchResults = forumNames
        .where((forum) => forum.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForumUlasanDetail(
                  details: forum_modelList.firstWhere((forum) => forum.name == searchResults[index]),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = forumNames
        .where((forum) => forum.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForumUlasanDetail(
                  details: forum_modelList.firstWhere((forum) => forum.name == suggestions[index]),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
