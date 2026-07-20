import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedSpec = "8/128";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Image.asset(widget.product['image_url'] as String, height: 400),
          const Spacer(flex: 2),
          Container(
            height: 240,
            decoration: BoxDecoration(
              color: Color.fromRGBO(220, 220, 220, 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${widget.product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['specs'] as List<String>).length,
                    itemBuilder: (context, index) {
                      final spec =
                          (widget.product['specs'] as List<String>)[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(35.0, 0, 12, 11),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSpec = spec;
                            });
                          },
                          child: Chip(
                            label: Text(spec.toString()),
                            backgroundColor: selectedSpec == spec
                                ? Theme.of(context).colorScheme.primary
                                : Color.fromRGBO(224, 224, 228, 1),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
