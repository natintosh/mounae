import 'package:flutter/material.dart';
import 'package:mounae/mounae_app.dart';
import 'package:mounae/providers/preference_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return PreferenceProvider();
          },
        ),
      ],
      child: MounaeApp(),
    ),
  );
}
