import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:olx_clone/screens/login/login_screen.dart';
import 'package:olx_clone/screens/signup/components/field_title.dart';

class SignUpScreen extends StatelessWidget {
  // const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.only(top: 0, right: 32, bottom: 30, left: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FieldTitle('Apelido', 'Como aparecerá em seus anúncios.'),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Exemplo: João S. Ramos',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      isDense: true
                    ),
                    keyboardType: TextInputType.name
                  ),
                  SizedBox(height: 16),

                  FieldTitle('E-mail', 'Enviaremos um e-mail de confirmação.'),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Exemplo: joao@gmail.com',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      isDense: true
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false
                  ),
                  SizedBox(height: 16),

                  FieldTitle('Celular'),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '(99) 99999-9999',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      isDense: true
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                  ),
                  SizedBox(height: 16),

                  FieldTitle('Senha', 'Use letras, números e caracteres especiais..'),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true
                    ),
                    obscureText: true
                  ),
                  SizedBox(height: 16),

                  FieldTitle('Confirmar Senha'),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true
                    ),
                    obscureText: true
                  ),
                  SizedBox(height: 16),

                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: ElevatedButton(
                      child: Text('CADASTRAR', style: TextStyle(fontSize: 18.0)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          // side: BorderSide(color: Colors.teal[800])
                        ),
                        elevation: 0
                      ),
                      onPressed: () {
                        print('Criar conta');
                      }
                    )
                  ),

                  Divider(color: Colors.black),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row( // Da uma quebra de linha caso ocorra um overflow do conteúdo
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Já tem conta? ',
                          style: TextStyle(fontSize: 16)
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                              fontSize: 16
                            )
                          )
                        )
                      ],
                    )
                  )
                ],
              )
            )
          ),
        )
      )
    );
  }
}