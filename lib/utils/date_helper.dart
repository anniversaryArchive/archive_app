import 'package:intl/intl.dart';

/// DateTime 형식 날짜 -> String 형식 날짜
enum FormatDateType {
  dotType,
  stringType,
}

String formatDate(DateTime date, [FormatDateType formatDateType = FormatDateType.dotType]) {
  DateFormat dateFormat;

  switch (formatDateType) {
    case FormatDateType.dotType:
      dateFormat = DateFormat('yyyy.MM.dd');
      break;
    case FormatDateType.stringType:
      dateFormat = DateFormat('yy년 MM월 dd일');
      break;
  }

  return dateFormat.format(date);
}
