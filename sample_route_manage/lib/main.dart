import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/pages/normal/first.dart';
import 'package:sample_route_manage/src/pages/normal/second.dart';

import 'src/home.dart';
import 'src/pages/next.dart';
import 'src/pages/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const Home(),
          transition: Transition.zoom,
        ),
        GetPage(
            name: "/first",
            page: () => const FirstPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/second",
            page: () => const SecondPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/next",
            page: () => const NextPage(),
            transition: Transition.zoom),
        GetPage(
          name: "/user/:uid",
          page: () => const UserPage(),
          transition: Transition.zoom,
        ),
      ],
    );
  }
}
