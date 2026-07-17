import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, Object> product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Column(
        children: [
          Text(
            product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Image.asset(product['image_url'] as String, height: 400),
          const Spacer(flex: 2),
          Container(
            height: 240,
            decoration: BoxDecoration(
              color: Color.fromRGBO(220, 220, 220, 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  "\$${product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (product['specs'] as List<String>).length,
                    itemBuilder: (context, index) {
                      final spec = (product['specs'] as List<String>)[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(35.0, 0, 12, 11),
                        child: Chip(label: Text(spec.toString())),
                      );
                    },
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
