import 'package:intl/intl.dart';

String formatDate({String format = 'yyyy-MM-dd', required DateTime date}) {
  return DateFormat(format).format(date);
}