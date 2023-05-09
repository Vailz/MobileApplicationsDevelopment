import 'package:flutter/material.dart';
import 'package:showcase_of_computer_components/data/product_data.dart';

class SavePage extends StatefulWidget {
  final int selectedIndex;

  const SavePage({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
    final selectedProduct = productData[widget.selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                selectedProduct.image,
                height: 200,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              selectedProduct.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              selectedProduct.desc,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              selectedProduct.price,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
