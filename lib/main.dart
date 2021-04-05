import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/presentation/journeys/home/home_screen.dart';
import 'package:pedantic/pedantic.dart';
import 'dependency_injections(di)/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
