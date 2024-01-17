import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pab_tean/sidebar/profile/register.dart';

class Login extends StatefulWidget {
  final Function(String, String) onSignIn;

  const Login(this.onSignIn, {Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Gadget4Fun',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              obscureText: true, // Hide the entered text
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Validasi apakah username dan password tidak kosong
                if (usernameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  widget.onSignIn(
                    usernameController.text,
                    passwordController.text,
                  );
                  Navigator.pop(context);
                } else {
                  // Tampilkan pesan kesalahan jika diperlukan
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
              ),
              child: const Text('Log-in'),
            ),
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                text: 'Belum punya akun?',
                style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Daftar di sini.',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
