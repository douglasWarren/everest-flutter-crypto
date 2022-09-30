import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final textFormValueProvider =
    StateProvider<Decimal>((ref) => Decimal.parse('0.0'));

final setedCoinPriceProvider = StateProvider<Decimal>(
  (ref) => Decimal.parse('0.0'),
);

final setedCoinSynbol = StateProvider<String>(
  (ref) => '',
);
final helpTextProvider = StateProvider<String>(
  (ref) => '',
);

final isValidProvider = StateProvider<bool>(
  (ref) => false,
);

final animateProvider = StateProvider<bool>(
  (ref) => true,
);
