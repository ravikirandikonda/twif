import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'welcome.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('hi', 'IN')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      startLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale, // Ensure the locale is set correctly
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: WelcomePage(),
    );
  }
}
