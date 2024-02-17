import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geoking/app.dart';
import 'package:geoking/bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}