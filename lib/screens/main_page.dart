
import 'package:flutter/material.dart';
import 'package:valyute/core/constants/colors.dart';
import 'package:valyute/screens/converter_page.dart';
import 'package:valyute/screens/exchange_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List<Widget>? _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      ConverterPage(),
      ExchangePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _pages![_currentIndex]),
      bottomNavigationBar: _bottomBar,
    );
  }
  BottomNavigationBar get _bottomBar {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      selectedItemColor: MyColor.kPrimaryColor,
      unselectedItemColor: MyColor.kPrimaryGrey,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange_outlined),
            label: "Valyuta hisoblas"),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), label: "Valyutalar"),
      ],
    );
  }
}
