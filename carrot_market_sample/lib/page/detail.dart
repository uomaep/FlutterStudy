import 'package:carousel_slider/carousel_slider.dart';
import 'package:carrot_market_sample/components/manor_temperature_widget.dart';
import 'package:carrot_market_sample/repository/contents_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/data_utils.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String> data;
  DetailContentView({super.key, required this.data});

  @override
  State<DetailContentView> createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView>
    with SingleTickerProviderStateMixin {
  late ContentsRepository contentsRepository;
  late Size size;
  late List<Map<String, String>> imgList;
  late int _current;
  double locationAlpha = 0;
  final ScrollController controller = ScrollController();
  late AnimationController _animationController;
  late Animation _colorTween;
  late bool isMyFavoriteContent = false;

  @override
  void initState() {
    super.initState();
    contentsRepository = ContentsRepository();
    _animationController = AnimationController(vsync: this);
    _colorTween = ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ).animate(_animationController);
    controller.addListener(() {
      setState(() {
        if (controller.offset > 255) {
          locationAlpha = 255;
        } else if (controller.offset < 0) {
          locationAlpha = 0;
        } else {
          locationAlpha = controller.offset;
        }
        _animationController.value = locationAlpha / 255;
      });
    });
    _loadMyFavoriteContentState();
  }

  void _loadMyFavoriteContentState() async {
    bool ck =
        await contentsRepository.isMyFavoriteContent(widget.data['cid'] ?? "");
    setState(() {
      isMyFavoriteContent = ck;
    });
  }

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

  Widget _makeIcon(IconData icon) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) => Icon(
        icon,
        color: _colorTween.value,
      ),
    );
  }

  _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(locationAlpha / 255),
      elevation: 0,
      leading: IconButton(
        icon: _makeIcon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: _makeIcon(Icons.share),
        ),
        IconButton(
          onPressed: () {},
          icon: _makeIcon(Icons.more_vert),
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

  Widget _line() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 1,
      color: Colors.grey.withOpacity(0.3),
    );
  }

  Widget _contentDetail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Text(
            widget.data['title'] ?? "",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "디지털/가전 ∙ 22시간 전",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "선물받은 새상품이고\n상품 꺼내보기만 했습니다\n거래는 직거래만 합니다.",
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "채팅 3 ∙ 관심 17 ∙ 조회 295",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _otherCellContents() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "판매자님의 판매 상품",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "모두보기",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _bodyWidget() {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _makeSliderImage(),
              _sellerSimpleInfo(),
              _line(),
              _contentDetail(),
              _line(),
              _otherCellContents(),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            delegate: SliverChildListDelegate(
              List.generate(20, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.grey,
                        height: 120,
                      ),
                    ),
                    const Text(
                      "상품 제목",
                      style: TextStyle(fontSize: 14),
                    ),
                    const Text(
                      "금액",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  _bottomNavBarWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      height: 70,
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              if (isMyFavoriteContent) {
                //제거
                await contentsRepository
                    .deleteMyFavoriteContent(widget.data['cid'] ?? "");
              } else {
                await contentsRepository.addMyFavoriteContent(widget.data);
              }
              setState(() {
                isMyFavoriteContent = !isMyFavoriteContent;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(milliseconds: 1000),
                  content: Text(
                    isMyFavoriteContent ? "관심목록에 추가됐습니다." : "관심목록에서 제거됐습니다.",
                  ),
                ),
              );
            },
            child: SvgPicture.asset(
              "assets/svg/heart_${isMyFavoriteContent ? "on" : "off"}.svg",
              width: 25,
              height: 25,
              color: const Color(0xfff08f4f),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 10),
            width: 1,
            height: 40,
            color: Colors.grey.withOpacity(0.3),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DataUtils.calcStringToWon("${widget.data['price']}"),
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "가격제안불가",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 7,
                    ),
                    color: const Color(0xfff08f4f),
                    child: const Text(
                      "채팅으로 거래하기",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
