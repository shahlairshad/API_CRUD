// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:my_flutter_1/A%20DECEMBER%20BATCH/API%20CRUD%20DEC/controller/homescreen_controller3.dart';

import 'package:my_flutter_1/A%20DECEMBER%20BATCH/API%20CRUD%20DEC/view/homescreen_crud.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        HomeScreencrud(),
      ),
    );
  }
}