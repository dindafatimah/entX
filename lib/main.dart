import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/menu_controller.dart' as menu_controller;
import 'package:flutter_web_dashboard/controllers/navigation_controller.dart';
import 'package:flutter_web_dashboard/layout.dart';
import 'package:flutter_web_dashboard/pages/404/error.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import 'routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const firebaseConfig = {
    'apiKey': "AIzaSyAiNuozb8K47jdAksjwX0C5Fh2ls4wRFQM",
    'authDomain': "finals-webent.firebaseapp.com",
    'projectId': "finals-webent",
    'storageBucket': "finals-webent.appspot.com",
    'messagingSenderId': "80353202444",
    'appId': "1:80353202444:web:e95caa342002170a057929"
  };

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: firebaseConfig['apiKey']!,
      authDomain: firebaseConfig['authDomain']!,
      projectId: firebaseConfig['projectId']!,
      storageBucket: firebaseConfig['storageBucket']!,
      messagingSenderId: firebaseConfig['messagingSenderId']!,
      appId: firebaseConfig['appId']!,
    ),
  );

  Get.put(menu_controller.MenuController());
  Get.put(NavigationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: rootRoute,
      unknownRoute: GetPage(name: '/not-found', page: () => const PageNotFound(), transition: Transition.fadeIn),
      getPages: [
        GetPage(
            name: rootRoute,
            page: () {
              return SiteLayout();
            }),
        GetPage(name: authenticationPageRoute, page: () => const AuthenticationPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'EnterpriseX',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.blue,
      ),
      // home: AuthenticationPage(),
    );
  }
}