import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/cart_page.dart';
import 'package:shopper/cart_provider.dart';
import 'package:shopper/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: "ShopPing",
        home: HomePage(),
        //home: HomePage(),
        theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(1, 52, 254, 1),
            primary: Color.fromRGBO(177, 234, 226, 1),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            bodySmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
          ),
        ),
      ),
    );
  }
}
