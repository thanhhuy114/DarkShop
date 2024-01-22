import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/utils/untils.dart';
import 'package:darkshop/views/stunning_splash_screen/auth_presenter.dart';
import 'package:darkshop/views/stunning_splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GlobalData.isToken = await AuthPresenter.isTokenAvailable();
  socket = IO.io(
      Constants.hosting,
      OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
          .build());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DarkShop',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 255, 185, 88),
      )),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
