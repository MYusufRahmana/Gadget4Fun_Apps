import 'package:flutter/material.dart';
import 'package:pab_tean/main/home_ponsel.dart';
import 'package:pab_tean/sidebar/profile/login.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  bool isSignedIn = false;
  String email = '';
  String userName = '';

  void signIn(String username, String email) {
    setState(() {
      isSignedIn = true;
      userName = username;
      this.email = email;
    });
  }

  void signOut() {
    setState(() {
      isSignedIn = false;
      userName = '';
      email = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.grey,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home_ponsel()),
              );
            }),
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
                        if (isSignedIn)
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
                            'Username',
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
                    if (isSignedIn)
                      Expanded(
                        child: Text(
                          '$userName',
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
                    if (isSignedIn)
                      Expanded(
                        child: Text(
                          '$email',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    if (isSignedIn) const Icon(Icons.edit),
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
                isSignedIn
                    ? TextButton(
                        onPressed: signOut, child: const Text('Sign Out'))
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => login(signIn),
                            ),
                          );
                        },
                        child: const Text('Sign In'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
