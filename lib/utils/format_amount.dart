import 'package:intl/intl.dart';

String formatAmount(num amount) {
  final formatter = NumberFormat.currency(symbol: "₦", locale: "en_NG");
  return formatter.format(amount);
}
