import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_route_manage/src/controller/count_controller_with_provider.dart';

import 'state/with_getx.dart';
import 'state/with_provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(CountControllerWithGetx());
    return Scaffold(
      appBar: AppBar(
        title: const Text("단순상태관리"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: WithGetX(),
            ),
            Expanded(
              child: ChangeNotifierProvider<CountControllerWithProvider>(
                create: (_) => CountControllerWithProvider(),
                child: const WithProvider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
