import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sample_route_manage/src/pages/normal/second.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SecondPage());
              },
              child: const Text("다음 페이지"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/second");
              },
              child: const Text("다음 Named 페이지"),
            ),
          ],
        ),
      ),
    );
  }
}
