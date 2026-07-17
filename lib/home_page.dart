import 'package:flutter/material.dart';
import 'package:shopper/global_variables.dart';
import 'package:shopper/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['2022', '2023', '2025', '2026'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(220, 220, 220, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                  child: Text(
                    "Phone\nStore",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here",
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
                            : Color.fromRGBO(224, 224, 228, 1),
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
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final pro = products[index];
                  return ProductCard(
                    price: pro['price'] as int,
                    title: pro['title'] as String,
                    img: pro['image_url'] as String,
                    bgcolor: index.isEven
                        ? const Color.fromARGB(255, 192, 234, 237)
                        : const Color.fromRGBO(220, 220, 220, 1),
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
