import 'package:easy_localization/easy_localization.dart';

import '../core.dart';

extension DoubleExtension on double {
  String get formatCurrency {
    final formatCurrency = NumberFormat('#,##0', 'en_US');
    String currencyString = formatCurrency.format(this);
    currencyString += AppConstants.currencyType;
    return currencyString;
  }
}
