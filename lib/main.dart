import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subject_api/ProviderSubject/data_provider.dart';
import 'package:subject_api/Screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<DataProvider>(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

