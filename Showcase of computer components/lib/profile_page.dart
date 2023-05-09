import 'package:flutter/material.dart';
import 'package:showcase_of_computer_components/login_page.dart';
import 'package:showcase_of_computer_components/signup_page.dart';
import 'package:showcase_of_computer_components/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: [
          if (_auth.currentUser != null) // check if user is logged in
            IconButton(
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ProfilePage()));
    },

              icon: const Icon(Icons.logout),
            ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kwhiteClr,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(top: 125),
              child: Text(
                'Войдите в профиль или зарегистрируйтесь',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const LoginPage()));
                },
                child: const Text('Авторизация'),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(kprimaryClr),
                  minimumSize:
                  MaterialStateProperty.all(const Size.fromHeight(50)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SignupPage()));
                },
                child: const Text(
                  'Регистрация',
                  style: TextStyle(color: kprimaryClr),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: kprimaryClr),
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
