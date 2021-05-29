import 'package:flutter/material.dart';
import 'package:olx_clone/components/custom_drawer/custom_drawer_header.dart';
import 'package:olx_clone/components/custom_drawer/page_section.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
          child: ListView(
            children: [
              CustomDrawerHeader(),
              PageSection()
            ]
          )
        ),
      ),
    );
  }
}
