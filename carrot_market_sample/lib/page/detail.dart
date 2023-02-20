import 'package:carousel_slider/carousel_slider.dart';
import 'package:carrot_market_sample/components/manor_temperature_widget.dart';
import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String> data;
  DetailContentView({super.key, required this.data});

  @override
  State<DetailContentView> createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  late Size size;
  late List<Map<String, String>> imgList;
  late int _current;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    _current = 0;
    imgList = [
      {"id": "0", "url": widget.data['image'] ?? ""},
      {"id": "1", "url": widget.data['image'] ?? ""},
      {"id": "2", "url": widget.data['image'] ?? ""},
      {"id": "3", "url": widget.data['image'] ?? ""},
      {"id": "4", "url": widget.data['image'] ?? ""},
    ];
  }

  _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _makeSliderImage() {
    return Stack(
      children: [
        Hero(
          tag: widget.data['cid'] ?? "",
          child: CarouselSlider(
            items: imgList.map((map) {
              return Image.asset(
                map['url'] ?? "",
                width: size.width,
                fit: BoxFit.fill,
              );
            }).toList(),
            options: CarouselOptions(
              height: size.width,
              initialPage: 0,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((map) {
              return GestureDetector(
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == int.parse(map['id'] ?? "")
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _sellerSimpleInfo() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(50),
          //   child: SizedBox(
          //     width: 50,
          //     height: 50,
          //     child: Image.asset("assets/images/user.png"),
          //   ),
          // ),
          CircleAvatar(
            radius: 25,
            backgroundImage: Image.asset("assets/images/user.png").image,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "개발하는남자",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text("제주시 도남동"),
            ],
          ),
          Expanded(child: ManorTemperature(manorTemp: 37.5)),
        ],
      ),
    );
  }

  _bodyWidget() {
    return Column(
      children: [
        _makeSliderImage(),
        _sellerSimpleInfo(),
      ],
    );
  }

  _bottomNavBarWidget() {
    return Container(
      width: size.width,
      height: 55,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavBarWidget(),
    );
  }
}
