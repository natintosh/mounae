import 'package:flutter/material.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class SettingsScreen extends StatefulWidget {
  static const String path = '/index/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return _SettingsView(this);
  }
}

class _SettingsView extends WidgetView<SettingsScreen, _SettingsScreenState> {
  _SettingsView(_SettingsScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
