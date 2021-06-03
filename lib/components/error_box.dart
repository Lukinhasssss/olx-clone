import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  // const ErrorBox({Key? key}) : super(key: key);

  ErrorBox({this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    if (message == null)
      return Container();
    else return Container(
      padding: EdgeInsets.all(10),
      color: Colors.red,
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Eita! 😱 $message. Por favor, tente novamente.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14
              )
            )
          )
        ]
      )
    );
  }
}
