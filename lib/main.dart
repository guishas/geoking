import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geoking/app.dart';
import 'package:geoking/bloc_observer.dart';
import 'package:geoking/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}
