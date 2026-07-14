import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final List<String> filter = const ['Samsung', 'Google', 'Apple', 'Xiaomi'];

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "helloo\noooooo",
                    style: TextStyle(fontWeight: FontWeight(700), fontSize: 40),
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hint: Text("Search here"),
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final label = filter[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 0,
                    ),
                    child: Chip(label: Text(label)),
                  );
                },
                itemCount: filter.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
