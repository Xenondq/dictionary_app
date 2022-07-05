import 'package:dictionary_app/core/view/deneme.dart';
import 'package:dictionary_app/core/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';
import 'core/cubit/translate_cubit.dart';
import 'core/service/translate_service.dart';
import 'core/view/find_words_view.dart';
import 'core/view/home_view.dart';
import 'core/view/translate_words_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 88, 90, 149),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _translateCubit,
              child: const HomeView(),
            ),
        '/second': (context) => BlocProvider.value(
              value: _translateCubit,
              child: const TranslateWord(),
            ),
        '/third': (context) => BlocProvider.value(
              value: _translateCubit,
              child: const FindWordsView(),
            ),
        '/settings': (context) => BlocProvider.value(
              value: _translateCubit,
              child: const SettingsView(),
            ),
      },
    );
  }

  @override
  void dispose() {
    _translateCubit.close();
    super.dispose();
  }
}
