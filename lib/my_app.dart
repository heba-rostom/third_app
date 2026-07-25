 
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/home/cubit/cubit/home_cubit.dart';
import 'package:project/features/home/ui/home_screen.dart';

 class MyApp extends StatelessWidget{
 const MyApp ({super.key});
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
          home: BlocProvider(
          create: (context) => HomeCubit(),
          child:HomeScreen(),
        ) ,
    );
  }
 }