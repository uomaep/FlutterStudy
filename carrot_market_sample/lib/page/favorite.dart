import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../repository/contents_repository.dart';
import '../utils/data_utils.dart';
import 'detail.dart';

class MyFavoriteContents extends StatefulWidget {
  const MyFavoriteContents({super.key});

  @override
  State<MyFavoriteContents> createState() => _MyFavoriteContentsState();
}

class _MyFavoriteContentsState extends State<MyFavoriteContents> {
  late ContentsRepository contentsRepository;
  @override
  void initState() {
    super.initState();
    contentsRepository = ContentsRepository();
  }

  _appbarWidget() {
    return AppBar(
      title: const Text(
        "관심목록",
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  makeDataList(List<dynamic> datas) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailContentView(data: datas[index]);
                },
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Hero(
                    tag: datas[index]['cid'] ?? "",
                    child: Image.asset(
                      "${datas[index]['image']}",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${datas[index]['title']}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "${datas[index]['location']}",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.3)),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          DataUtils.calcStringToWon("${datas[index]['price']}"),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/heart_off.svg",
                                width: 13,
                                height: 13,
                              ),
                              const SizedBox(width: 4),
                              Text("${datas[index]['likes']}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 1,
          color: Colors.black.withOpacity(0.4),
        );
      },
      itemCount: datas.length,
    );
  }

  _bodyWidget() {
    return FutureBuilder(
      future: _loadMyFavoriteContentList(),
      builder: (
        BuildContext context,
        AsyncSnapshot<dynamic> snapshot,
      ) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError && snapshot.error == Exception) {
          return const Center(child: Text("데이터 오류"));
        }

        if (snapshot.hasData) {
          return makeDataList(snapshot.data ?? []);
        }

        return const Center(child: Text("해당 지역에 데이터가 없습니다."));
      },
    );
  }

  _loadMyFavoriteContentList() async {
    return await contentsRepository.loadFavoriteContents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
