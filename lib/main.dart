import 'package:dictionary_app/core/service/translate_service.dart';
import 'package:dictionary_app/core/view/translate_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';

import 'core/cubit/translate_cubit.dart';
import 'core/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TranslateCubit(TranslateService(NetworkManager(
            options: BaseOptions(
                baseUrl: "https://api.dictionaryapi.dev/api/v2/entries/en/")))),
        child: HomeView(),
      ),
    );
  }
}
