import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_clone/screens/home/home_screen.dart';
import 'package:olx_clone/stores/page_store.dart';

class BaseScreen extends StatefulWidget {
  // const BaseScreen({Key key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();
    
    reaction(
      (_) => pageStore.page,
      (page) => pageController.jumpToPage(page)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(), // Para impedir a rolagem da tela
        children: [
          HomeScreen(),
          Container(color: Colors.green),
          Container(color: Colors.blue),
          Container(color: Colors.deepPurple),
          Container(color: Colors.deepOrange)
        ],
      ),
    );
  }
}
