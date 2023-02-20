import 'package:intl/intl.dart';

class DataUtils {
  static final oCcy =
      NumberFormat("#,###", "ko_KR"); // 한국 돈단위 ,찍어주는 거 intl 라이브러리 필요
  static String calcStringToWon(String priceString) {
    if (priceString == "무료나눔") return priceString;
    return "${oCcy.format(int.parse(priceString))}원";
  }
}
