import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iots/bloc/iot_bloc.dart';
import 'package:iots/page/grap.dart';
import 'package:iots/page/mainmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final lgsBloc = BlocProvider(create: (context) => LgsBloc());
    return MultiBlocProvider(
      providers: [lgsBloc],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Mainmenu(),
      ),
    );
  }
}
