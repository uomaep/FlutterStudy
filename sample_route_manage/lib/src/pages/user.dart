import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${Get.parameters['uid']}"),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                Get.back();
              },
              child: const Text("뒤로 이동"),
            ),
          ],
        ),
      ),
    );
  }
}
