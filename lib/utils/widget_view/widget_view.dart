import 'package:flutter/material.dart';

abstract class WidgetView<T extends StatefulWidget, S extends State<T>>
    extends StatelessWidget {
  final S state;

  T get widget => state.widget;

  const WidgetView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
}
