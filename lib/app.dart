import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoking/common/routes.dart';
import 'package:geoking/firebase/database_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DatabaseRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Geoking',
        theme: ThemeData(
          fontFamily: 'Fredoka',
        ),
        initialRoute: '/',
        onGenerateRoute: RouteInfo.generateRoutes,
      ),
    );
  }
}
