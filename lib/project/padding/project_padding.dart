import 'package:flutter/cupertino.dart';

class ButtonPadding extends EdgeInsets {
  ButtonPadding.all() : super.symmetric(horizontal: 50, vertical: 10);
}

class BaykusPadding extends EdgeInsets {
  BaykusPadding.all() : super.all(30);
}

class ManuelPadding extends EdgeInsets {
  ManuelPadding.all() : super.all(8);
}

class OnlyTop extends EdgeInsets {
  OnlyTop.all() : super.only(top: 20);
}
