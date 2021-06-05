import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  // const PageTile({Key key}) : super(key: key);

  PageTile({this.label, this.iconData, this.onTap, this.highlighted}); // Obs: Não entendi como funcionam as chaves no construtor

  final String? label;
  final IconData? iconData;
  final VoidCallback? onTap;
  final bool? highlighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label!,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: highlighted! ? Colors.orange : Color.fromRGBO(80, 80, 80, 1)
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted! ? Colors.orange : Color.fromRGBO(80, 80, 80, 1),
      ),
      onTap: onTap,
    );
  }
}
