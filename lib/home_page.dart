import 'package:flutter/material.dart';
import 'package:shopper/global_variables.dart';
import 'package:shopper/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['Samsung', 'Google', 'Apple', 'Xiaomi'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

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
                  padding: EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                  child: Text(
                    "Phone\nStore",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here",
                      prefixIcon: const Icon(Icons.search),
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
                  final label = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = label;
                        });
                      },
                      child: Chip(
                        label: Text(label),
                        backgroundColor: selectedFilter == label
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromRGBO(245, 248, 237, 1),
                        side: BorderSide(
                          color: Color.fromRGBO(245, 243, 250, 1),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  final pro = product[index];
                  return ProductCard(
                    price: pro['price'] as int,
                    title: pro['title'] as String,
                    img: pro['image_url'] as String,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
