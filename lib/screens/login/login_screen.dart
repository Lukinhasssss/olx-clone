import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 32),
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
                  Text(
                    'Acessar com E-mail:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 4, left: 3),
                    child: Text(
                      'E-mail',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      )
                    )
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true // Diminui um pouco a altura do input
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4, left: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          )
                        ),
                        GestureDetector(
                          child: Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple
                            )
                          ),
                          onTap: () {
                            print('Ir para tela de esqueceu a senha.');
                          }
                        )
                      ],
                    )
                  ),
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
                      child: Text('ENTRAR', style: TextStyle(fontSize: 18.0)),
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
                        print('Fazer login');
                      }
                    )
                  ),
                  Divider(color: Colors.black),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Wrap( // Da uma quebra de linha caso ocorra um overflow do conteúdo
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          'Não tem conta? ',
                          style: TextStyle(fontSize: 16)
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpScreen()));
                          },
                          child: Text(
                            'Cadastre-se',
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
                ]
              ),
            )
          ),
        ),
      )
    );
  }
}
