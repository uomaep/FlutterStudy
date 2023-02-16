import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/home.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                Get.back();
              },
              child: const Text("뒤로 이동"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAll(() => const Home());
              },
              child: const Text("홈으로 이동"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed("/");
              },
              child: const Text("Named 홈으로 이동"),
            ),
          ],
        ),
      ),
    );
  }
}
