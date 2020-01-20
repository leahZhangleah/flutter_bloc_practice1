import 'package:flutter/material.dart';
import 'collapsing_profile.dart';
import 'collapsing_tab.dart';
import 'counter_page.dart';
import 'bloc_provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: const Color(0xFF02BB9F),
          primaryColorDark: const Color(0xFF167F67),
          accentColor: const Color(0xFF167F67),
        ),
        home: CounterPage(),
        /*initialRoute: '/',
        routes: {
          '/':(context) => CollapsingTab(),
          '/profile': (context) => CollapsingProfile(),
        },*/
      ),
    );
  }
}
