import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());

  await Parse().initialize(
    dotenv.env['APP_ID'],
    dotenv.env['SERVER_URL'],
    clientKey: dotenv.env['CLIENT_KEY'],
    autoSendSessionId: true,
    debug: true
  );

  final category = ParseObject('Categories')
    ..set('Title', 'Camisetas')
    ..set('Position', 2);

  final response = await category.save();

  print(response.success);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OLX Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: Container()
    );
  }
}
