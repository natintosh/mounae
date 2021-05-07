import 'package:flutter/material.dart';
import 'package:mounae/utils/themes/theme.dart';

class PreferenceProvider extends ChangeNotifier {
  ThemeOption _themeOption = ThemeOption.LIGHT;

  set themeOption(ThemeOption option) {
    _themeOption = option;
    notifyListeners();
  }

  ThemeOption get themeOption => _themeOption;
}
