import 'package:chefpartner_mobile/src/global/navigator_key.dart';
import 'package:chefpartner_mobile/src/routes/screen_routes.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/database/sqlite_database_connection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SQLiteDatabaseConnection.createDatabase();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      navigatorKey: navigatorKey,
      routes: screenRoutes,
    );
  }
}
