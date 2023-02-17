import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sample_route_manage/src/pages/dependencys/dependency_manage_page.dart';
import 'package:sample_route_manage/src/pages/normal/first.dart';
import 'package:sample_route_manage/src/pages/reactive_state_manage_page.dart';
import 'package:sample_route_manage/src/pages/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("라우트 관리 홈"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => const FirstPage());
              },
              child: const Text("일반적인 라우트"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/first");
              },
              child: const Text("Named 라우트"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/next", arguments: User(name: "uomaep", age: 24));
              },
              child: const Text("argument 전달"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/user/28");
              },
              child: const Text("동적 url"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SimpleStateManagePage());
              },
              child: const Text("단순 상태관리"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ReactiveStateManagePage());
              },
              child: const Text("반응형 상태관리"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const DependencyManagePage());
              },
              child: const Text("의존성 관리"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/binding");
              },
              child: const Text("바인딩"),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;

  User({required this.name, required this.age});
}
