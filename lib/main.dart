import 'package:flutter/material.dart';
import 'package:openfashion/Helper/cart_provider.dart';
import 'package:openfashion/Widgets/uiHelper.dart';
import 'package:provider/provider.dart';

import 'Pages/homepage.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>CartProvider(),
    child: Builder(builder: (BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Open Fashion',
        theme: ThemeData(
          fontFamily: 'BodoniModa', // Set the custom font
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: Homepage(),

      );
    }),
    );
  }
}

