import 'package:dictionary_app/core/view/translate_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';
import 'core/cubit/translate_cubit.dart';
import 'core/service/translate_service.dart';
import 'core/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final TranslateCubit _translateCubit = TranslateCubit(TranslateService(
    NetworkManager(
        options: BaseOptions(
            baseUrl: "https://api.dictionaryapi.dev/api/v2/entries/en/"))));

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _translateCubit,
              child: HomeView(),
            ),
        '/second': (context) => BlocProvider.value(
              value: _translateCubit,
              child: TranslateWord(),
            )
      },
    );
  }

  @override
  void dispose() {
    _translateCubit.close();
    super.dispose();
  }
}
