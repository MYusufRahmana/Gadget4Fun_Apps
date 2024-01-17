import 'package:flutter/material.dart';
import 'package:pab_tean/main/home_ponsel.dart';
import 'package:pab_tean/sidebar/profile/login.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  bool isMasuk = false;
  String email = '';
  String namaPengguna = '';

  void masuk(String username, String email) {
    setState(() {
      isMasuk = true;
      namaPengguna = username;
      this.email = email;
    });
  }

  void keluar() {
    setState(() {
      isMasuk = false;
      namaPengguna = '';
      email = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.grey,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home_ponsel()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/user/User.png'),
                          ),
                        ),
                        if (isMasuk)
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.grey,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey[100],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Nama Pengguna',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      ': ',
                      style: TextStyle(fontSize: 18),
                    ),
                    if (isMasuk)
                      Expanded(
                        child: Text(
                          '$namaPengguna',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Text(
                      ': ',
                      style: TextStyle(fontSize: 18),
                    ),
                    if (isMasuk)
                      Expanded(
                        child: Text(
                          '$email',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    if (isMasuk) const Icon(Icons.edit),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                isMasuk
                    ? TextButton(
                        onPressed: keluar, child: const Text('Keluar'))
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(masuk),
                            ),
                          );
                        },
                        child: const Text('Masuk'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
