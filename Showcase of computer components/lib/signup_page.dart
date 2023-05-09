import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:showcase_of_computer_components/login_page.dart';
import 'package:showcase_of_computer_components/profile_page.dart';
import 'package:showcase_of_computer_components/components/customized_textfield.dart';
import 'package:showcase_of_computer_components/utils/colors.dart';
import 'package:showcase_of_computer_components/shop_page.dart';
import 'package:flutter/services.dart';
import 'dart:core';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int _selectedIndex = 0;
  bool _loadingButton = false;
  final nameRegex = RegExp(r'^[a-zA-Zа-яА-Я]+(-[a-zA-Zа-яА-Я]+)*$');
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _registerUser() async {
    setState(() {
      _loadingButton = true;
    });

    if (_passwordController.text.length < 8) {
      _showErrorDialog('Password must be at least 8 characters.');
      setState(() {
        _loadingButton = false;
      });
      return;
    }

    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Registration Successful
      print(userCredential.user!.uid);

      // Navigate to Profile Page after Registration
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfilePage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showErrorDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _showErrorDialog('An account already exists with this email address.');
      } else {
        _showErrorDialog(e.toString());
      }
    } catch (e) {
      _showErrorDialog(e.toString());
    }

    setState(() {
      _loadingButton = false;
    });
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhiteClr,
        body: SafeArea(
        child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    Transform.translate(
    offset: const Offset(-180, -145),
    child: GestureDetector(
    behavior: HitTestBehavior.translucent,
    child: Icon(
    Icons.arrow_back_ios_sharp,
    color: kprimaryClr,
    ),
    onTap: () {
    Navigator.pop(
    context,
    MaterialPageRoute(builder: (_) => const ProfilePage()),
    );
    },
    ),
    ),
    Transform.translate(
    offset: const Offset(0.0, -44.0),
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
    "Добро пожаловать!",
    style: TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
    ),
    ),
    ),
    CustomizedTextfield(
    myController: _usernameController,
    hintText: "Имя",
    isPassword: false,
    ),
    CustomizedTextfield(
    myController: _emailController,
    hintText: "Введите Email",
    isPassword: false,
    ),
    CustomizedTextfield(
    myController: _passwordController,
    hintText: "Введите пароль",
      isPassword: true,
    ),
    Transform.translate(
    offset: Offset(0, 50),
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: ElevatedButton(
      onPressed: () async {
        // Проверка на пустоту полей
        if (_usernameController.text.isEmpty ||
            _emailController.text.isEmpty ||
            _passwordController.text.isEmpty) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Ошибка"),
              content: Text("Пожалуйста, заполните все поля."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("ОК"),
                ),
              ],
            ),
          );
          return;
        }
        // Проверка на корректность имени
        if (!nameRegex.hasMatch(_usernameController.text)) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Ошибка"),
              content: Text("Пожалуйста, введите корректное имя."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("ОК"),
                ),
              ],
            ),
          );
          return;
        }
        // Проверка на корректность email
        if (!emailRegex.hasMatch(_emailController.text)) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Ошибка"),
              content: Text("Пожалуйста, введите корректный email."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("ОК"),
                ),
              ],
            ),
          );
          return;
        }
        // Проверка на длину пароля
        if (_passwordController.text.length < 8) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Ошибка"),
              content: Text("Пароль должен быть не меньше 8 символов."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("ОК"),
                ),
              ],
            ),
          );
          return;
        }

        try {
          UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
          // If the user was successfully created in Firebase, navigate to the ProfilePage
          if (userCredential != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopPage()),
            );
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Ошибка"),
                content: Text("Пользователь с таким email уже зарегистрирован."),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("ОК"),
                  ),
                ],
              ),
            );
          }
        } catch (e) {
          print(e);
        }
      },
      child: const Text('Зарегистрироваться'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kprimaryClr),
        minimumSize: MaterialStateProperty.all(
          const Size.fromHeight(50),
        ),
      ),
    ),
    ),
    ),
          Transform.translate(
            offset: Offset(0, 58),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Уже зарегистрированы?",
                  style: TextStyle(
                    color: kgrayClr,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "Авторизоваться",
                    style: TextStyle(
                      color: kprimaryClr,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
        ),
        ),
        ),
    );
  }
}