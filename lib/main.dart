import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit.dart';
import 'package:travel/cubit/logics.dart';
import 'package:travel/services/data_services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: BlocProvider<AppCubit>(
        create:(context)=>AppCubit(
          data:DataService(),
        ),
        child: Logics(),
      ),
    );
  }
}
