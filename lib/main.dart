import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:olx_clone/screens/base/base_screen.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await initializeParse();
  runApp(MyApp());
}

Future initializeParse() async {
  await Parse().initialize(
      dotenv.env['APP_ID'],
      dotenv.env['SERVER_URL'],
      clientKey: dotenv.env['CLIENT_KEY'],
      autoSendSessionId: true,
      debug: true
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OLX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: BaseScreen()
    );
  }
}
