import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:showcase_of_computer_components/splash_screen.dart';
import 'package:showcase_of_computer_components/utils/application_state.dart';
import 'package:showcase_of_computer_components/firebase_options.dart';
import 'package:showcase_of_computer_components/utils/colors.dart';
import 'package:flutter/rendering.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationSate(),
      builder: (context, _) => Consumer<ApplicationSate>(
        builder: (context, applicationState, _) {
          Widget child;
          if (applicationState.loginState == ApplicationLoginSate.loggedIn) {
            child = const MyApp();
          } else {
            child = const SplashScreen();
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
            theme: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: kprimaryClr, // цвет курсора
              ),
              primaryColor: Colors.transparent,
              primaryColorBrightness: Brightness.light,
            ),
          );
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SplashScreen(),
    );
  }
}
