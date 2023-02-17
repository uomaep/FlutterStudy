import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  WithGetX({super.key});
  final CountControllerWithGetx _countControllerWithGetx =
      Get.put(CountControllerWithGetx());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "GetX",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          GetBuilder<CountControllerWithGetx>(
            builder: (controller) {
              return Text("${controller.count}",
                  style: const TextStyle(fontSize: 50));
            },
          ),
          ElevatedButton(
            onPressed: () {
              _countControllerWithGetx.increase();
            },
            child: const Text(
              "+",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
