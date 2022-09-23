import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/datasources/wallet_datasource.dart';
import '../../../controllers/providers/visible_provider.dart';
import '../widgets/coin_list.dart';
import '../widgets/wallet_details.dart';

class PortfolioPage extends HookConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(visibleProvider);
    WalletDatasource walletDatasource = WalletDatasource();
    List<CoinViewData> coinList = walletDatasource.getCoinsWallet();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            WalletDetails(
                visible: visible,
                changeVisibility: () {
                  ref.watch(visibleProvider.state).state = !visible;
                }),
            CoinList(coinList: coinList, visible: visible),
          ],
        ),
      ),
    );
  }
}
