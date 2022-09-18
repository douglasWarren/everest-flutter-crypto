import 'package:everest_crypto/app/presenter/ui/available/available_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/presenter/controllers/providers/get_all_coins_provider.dart';
import '../app/presenter/ui/movements/movements_page.dart';
import '../app/presenter/ui/portfolio/view/portfolio_page.dart';
import 'shared/assets.dart';
import 'shared/styles.dart';

class Home extends StatefulHookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  static const route = '/';

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int currentPage = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    ref.read(coinsNotifierProvider.notifier).getAllCoins();
    pageController = PageController(initialPage: currentPage);
  }

  setCurrentPage(page) {
    setState(
      () {
        currentPage = page;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          onPageChanged: setCurrentPage,
          controller: pageController,
          children: const [
            PortfolioPage(),
            AvailablePage(),
            MovementsPage(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colorBlackText,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        backgroundColor: Colors.white,
        onTap: (page) {
          pageController.animateToPage(page,
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            label: "Potifólio",
            icon: portfolioIcon,
            activeIcon: portfolioActiveIcon,
          ),
          BottomNavigationBarItem(
            label: "Comprar",
            icon: accountIcon,
            activeIcon: accountActiveIcon,
          ),
          BottomNavigationBarItem(
            label: "Movimentações",
            icon: movementsIcon,
            activeIcon: movementsActiveIcon,
          ),
        ],
      ),
    );
  }
}