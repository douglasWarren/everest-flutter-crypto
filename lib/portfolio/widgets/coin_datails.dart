import 'package:flutter/material.dart';

import '../../models/coin.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';

class CoinDetails extends StatelessWidget {
  const CoinDetails({
    Key? key,
    required this.coin,
    required this.hideText,
    required this.value,
    required this.visible,
  }) : super(key: key);

  final Coin coin;
  final Decoration hideText;

  final double value;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: colorGrayDivider,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image(
                  height: 50,
                  image: AssetImage(coin.image),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coin.symbol, style: valueStyle),
                  const SizedBox(height: 4),
                  Text(coin.name, style: subTitleStyleCoin),
                ],
              ),
              const Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: hideText,
                    child: Text(
                      "R\$ ${number.format(value)}",
                      style: visible ? valueStyle : valueStyleHide,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        decoration: hideText,
                        child: Text(
                          coin.amount,
                          style: visible
                              ? subTitleStyleCoin
                              : subTitleStyleCoinHide,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(coin.symbol, style: subTitleStyleCoin),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30.0, left: 10),
                child: Icon(Icons.arrow_forward_ios_sharp, size: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
