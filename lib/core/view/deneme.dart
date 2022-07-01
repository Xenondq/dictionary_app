import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/translate_cubit.dart';

class TranslateMainView extends StatelessWidget {
  const TranslateMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(children: [
          TextFormField(
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Find")),
        ]),
      ),
    );
  }
}
