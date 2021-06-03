import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/screens/signup/components/field_title.dart';
import 'package:olx_clone/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  // const SignUpScreen({Key key}) : super(key: key);

  final SignUpStore signUpStore = SignUpStore();

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
                  Observer(builder: (context) => TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Exemplo: João S. Ramos',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      isDense: true,
                      errorText: signUpStore.nameError
                    ),
                    keyboardType: TextInputType.name,
                    onChanged: signUpStore.setName
                  )),
                  SizedBox(height: 16),

                  FieldTitle('E-mail', 'Enviaremos um e-mail de confirmação.'),
                  Observer(builder: (context) => TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Exemplo: joao@gmail.com',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      isDense: true,
                      errorText: signUpStore.emailError
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    onChanged: signUpStore.setEmail
                  )),
                  SizedBox(height: 16),

                  FieldTitle('Celular'),
                  Observer(builder: (context) => TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '(99) 99999-9999',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      isDense: true,
                      errorText: signUpStore.phoneError
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                    onChanged: signUpStore.setPhone
                  )),
                  SizedBox(height: 16),

                  FieldTitle('Senha', 'Use letras, números e caracteres especiais..'),
                  Observer(builder: (context) => TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      errorText: signUpStore.pass1Error
                    ),
                    obscureText: true,
                    onChanged: signUpStore.setPass1
                  )),
                  SizedBox(height: 16),

                  FieldTitle('Confirmar Senha'),
                  Observer(builder: (context) => TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      errorText: signUpStore.pass2Error
                    ),
                    obscureText: true,
                    onChanged: signUpStore.setPass2
                  )),
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
