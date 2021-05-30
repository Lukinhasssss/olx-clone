import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  // const FieldTitle({Key key}) : super(key: key);

  FieldTitle(this.title, [this.subtitle]);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3, bottom: 4),
      child: Wrap(
        // crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Row(
            children: [
              Text(
                '$title',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                )
              ),
            ],
          ),
          subtitle != null ? Row(
            children: [
              Text(
                '$subtitle',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12
                ),
              ),
            ],
          ) : Container()
        ]
      )
    );
  }
}
