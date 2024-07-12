import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership_assigment/bloc/items_bloc.dart';
import 'package:intership_assigment/repositories/items_repository.dart';
import 'package:intership_assigment/screens/audio_player_screen.dart';
import 'package:intership_assigment/screens/form_screen.dart';
import 'package:intership_assigment/screens/home_screen.dart';


void main() {
  final itemsRepository = ItemsRepository();
  runApp(MyApp(itemsRepository: itemsRepository));
}

class MyApp extends StatelessWidget {
  final ItemsRepository itemsRepository;

  MyApp({required this.itemsRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:BlocProvider(
        create: (_) => ItemsBloc(itemsRepository: itemsRepository),
        child: HomeScreen(),
      ),
    );
  }
}

