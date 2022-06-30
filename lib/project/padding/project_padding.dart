import 'package:flutter/cupertino.dart';

class ButtonPadding extends EdgeInsets {
  const ButtonPadding.all() : super.symmetric(horizontal: 50, vertical: 10);
}

class BaykusPadding extends EdgeInsets {
  const BaykusPadding.all() : super.all(30);
}

class ManuelPadding extends EdgeInsets {
  const ManuelPadding.all() : super.all(8);
}

class OnlyTop extends EdgeInsets {
  const OnlyTop.all() : super.only(top: 20);
}
