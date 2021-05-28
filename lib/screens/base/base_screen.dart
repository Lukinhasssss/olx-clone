import 'package:flutter/material.dart';
import 'package:olx_clone/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {
  // const BaseScreen({Key key}) : super(key: key);

  final PageController pageController = PageController();

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
