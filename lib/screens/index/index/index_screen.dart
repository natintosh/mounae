import 'package:flutter/material.dart';
import 'package:mounae/screens/index/overview/overview_screen.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return _IndexScreenView(this);
  }

  List<Widget> views = [OverviewScreen(), Container(), Container()];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.style),
      label: 'Others',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
  int index = 0;
}

class _IndexScreenView extends WidgetView<IndexScreen, _IndexScreenState> {
  _IndexScreenView(_IndexScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: state.views[state.index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.index,
        items: state.items,
      ),
    );
  }
}
