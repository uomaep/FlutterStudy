import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/controller/dependency_controller.dart';
import 'package:sample_route_manage/src/pages/dependencys/get_lazyput.dart';
import 'package:sample_route_manage/src/pages/dependencys/get_put.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("의존성 주입"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Getput"),
              onPressed: () {
                Get.to(
                  () => const GetPut(),
                  binding: BindingsBuilder(() {
                    Get.put(DependencyController());
                  }),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Get.lazyPut"),
              onPressed: () {
                Get.to(
                  () => const GetLazyPut(),
                  binding: BindingsBuilder(() {
                    Get.lazyPut<DependencyController>(
                        () => DependencyController());
                  }),
                );
              },
            ),
            ElevatedButton(
              child: const Text(""),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text(""),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
