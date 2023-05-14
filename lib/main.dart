import 'package:flutter/material.dart';
import 'package:text202/presentation/resources/routes_manager.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text202',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.signIn,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Flutter app"),
      ),
      // body: const MyCustomForm(),
    );
  }
}