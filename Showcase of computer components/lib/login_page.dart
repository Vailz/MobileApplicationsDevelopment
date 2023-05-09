import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcase_of_computer_components/signup_page.dart';
import 'package:showcase_of_computer_components/profile_page.dart';
import 'package:showcase_of_computer_components/components/customized_textfield.dart';
import 'package:showcase_of_computer_components/utils/application_state.dart';
import 'package:showcase_of_computer_components/utils/colors.dart';
import 'package:showcase_of_computer_components/shop_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loadingButton = false;
  String _errorMessage = '';



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
                offset: const Offset(-180, -170),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: kprimaryClr,
                  ),
                  onTap: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (_) => const ShopPage()),
                    );
                  },
                ),
              ),
              Transform.translate(
                offset: const Offset(0.0, -44.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "С возвращением! \nРады Вас видеть снова!",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                offset: const Offset(0, 50),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    onPressed: _loadingButton
                        ? null
                        : () async {
                      if (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Ошибка'),
                            content: const Text('Пожалуйста, заполните все поля'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                        return;
                      }

                      setState(() {
                        _loadingButton = true;
                        _errorMessage = '';
                      });
                      ApplicationSate applicationState =
                      Provider.of<ApplicationSate>(context,
                          listen: false);

                      try {
                        // Проверяем заполнены ли поля электронной почты и пароля
                        if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Ошибка'),
                              content: const Text('Пожалуйста, заполните все поля'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                          return;
                        }

                        // Запускаем процесс входа в систему
                        setState(() {
                          _loadingButton = true;
                          _errorMessage = '';
                        });

                        UserCredential userCredential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        // Вход выполнен успешно, устанавливаем isLoggedIn в true и переходим на страницу магазина
                        ApplicationSate applicationState =
                        Provider.of<ApplicationSate>(context, listen: false);
                        applicationState.isLoggedIn = true;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      } on FirebaseAuthException catch (e) {
                        // Обработка ошибок
                        print(e);
                        setState(() {
                          _loadingButton = false;
                          if (e.code == 'user-not-found' || e.code == 'wrong-password') {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Ошибка'),
                                content: const Text('Пользователь не зарегистрирован'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                            return;
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Ошибка'),
                                content: const Text('Введите корректный Emal'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                        });
                      }
                    },

                    child: _loadingButton
                        ? const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )
                        : const Text('Войти'),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(kprimaryClr),
                      minimumSize: MaterialStateProperty.all(
                        const Size.fromHeight(50),
                      ),
                    ),
                  ),
                ),
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              Transform.translate(
                offset: Offset(0, 58),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Нет аккаунта?",
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
                          MaterialPageRoute(builder: (_) => const SignupPage()),
                        );
                      },
                      child: Text(
                        "Зарегистрироваться",
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