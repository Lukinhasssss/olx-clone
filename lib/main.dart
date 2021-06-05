import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/screens/base/base_screen.dart';
import 'package:olx_clone/stores/page_store.dart';
import 'package:olx_clone/stores/user_manager_store.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:path_provider/path_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await initializeParse();
  setupLocators();

  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

Future initializeParse() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();

  await Parse().initialize(
    dotenv.env['APP_ID']!,
    dotenv.env['SERVER_URL']!,
    clientKey: dotenv.env['CLIENT_KEY'],
    autoSendSessionId: true,
    debug: true,
    coreStore: await CoreStoreSembastImp.getInstance(appDocDir.path + "/data")
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
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.orange
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: BaseScreen()
    );
  }
}
