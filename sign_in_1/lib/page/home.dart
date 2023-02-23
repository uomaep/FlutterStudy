import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6524FF),
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          print("floating action button click!");
        },
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/img-prada01.jpeg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color(0xFF191919).withOpacity(0.5),
                  BlendMode.hardLight,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 149,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "세상에서\n나를 잘 나타내는\n마지막 찬스",
                  style: TextStyle(
                    fontFamily: 'Noto_Sans_KR',
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "스타일 여행을 떠나보세요",
                  style: TextStyle(
                    fontFamily: 'Noto_Sans_KR',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
