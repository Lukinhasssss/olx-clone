import 'package:flutter/material.dart';
import 'package:olx_clone/screens/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  // const CustomDrawerHeader({Key key}) : super(key: key);

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
                  'Acesse sua conta agora!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  )
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Para quando voltar o drawer ficar fechado
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text(
                    'Clique aqui',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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
