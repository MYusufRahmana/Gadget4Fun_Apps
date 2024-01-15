import 'package:flutter/material.dart';
import 'package:pab_tean/main/home_ponsel.dart';

class MyDevice extends StatelessWidget {
  const MyDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyDevice',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home_ponsel()),
              );
            }),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MyDevices'),
          ],
        ),
      ),
    );
  }
}
