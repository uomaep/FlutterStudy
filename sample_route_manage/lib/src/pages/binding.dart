import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/controller/count_controller_with_getx.dart';

class BindingPage extends StatelessWidget {
  const BindingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<CountControllerWithGetx>(builder: (_) {
            return Text(_.count.toString());
          }),
          ElevatedButton(
            onPressed: () {
              CountControllerWithGetx.to.increase();
            },
            child: const Text(""),
          )
        ],
      ),
    );
  }
}
