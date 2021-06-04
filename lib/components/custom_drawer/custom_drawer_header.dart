import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/screens/login/login_screen.dart';
import 'package:olx_clone/stores/page_store.dart';
import 'package:olx_clone/stores/user_manager_store.dart';

class CustomDrawerHeader extends StatelessWidget {
  // const CustomDrawerHeader({Key key}) : super(key: key);

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(Icons.person, color: Colors.white, size: 45),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userManagerStore.isLoggedIn ? userManagerStore.user.name : 'Acesse sua conta agora!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                  )
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Para quando voltar o drawer ficar fechado
                    userManagerStore.isLoggedIn
                      ? GetIt.I<PageStore>().setPage(4)
                      : Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text(
                    userManagerStore.isLoggedIn ? userManagerStore.user.email : 'Clique aqui',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    )
                  ),
                )
              ]
            ),
          )
        ]
      ),
    );
  }
}
