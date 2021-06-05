import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olx_clone/components/custom_drawer/custom_drawer.dart';

class CreateScreen extends StatelessWidget {
  // const CreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.grey,
        fontSize: 18
    );

    final contentPadding = EdgeInsets.fromLTRB(16, 10, 16, 10);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar Anúncio'),
        centerTitle: true
      ),
      body: Card(
        margin: EdgeInsets.only(top: 0, right: 16, bottom: 15, left: 16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Título *',
                labelStyle: labelStyle,
                contentPadding: contentPadding
              ),
              maxLines: null
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Descrição *',
                labelStyle: labelStyle,
                contentPadding: contentPadding
              )
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Preço *',
                labelStyle: labelStyle,
                contentPadding: contentPadding,
                prefixText: 'R\$ '
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true)
              ]
            )
          ],
        )
      )
    );
  }
}
