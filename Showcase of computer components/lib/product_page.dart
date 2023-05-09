import 'package:flutter/material.dart';
import 'package:showcase_of_computer_components/data/product_data.dart';
import 'package:showcase_of_computer_components/utils/colors.dart';
import 'package:showcase_of_computer_components/shop_page.dart';

class ProductPage extends StatefulWidget {
  final int index;

  const ProductPage({Key? key, required this.index}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Создаем список, где будем хранить информацию о том,
  // какие иконки были нажаты
  List<bool> _iconPressedList = List.filled(productData.length, false);
  List<bool> _icon2PressedList = List.filled(productData.length, false);
  @override
  Widget build(BuildContext context) {
    final product = productData[widget.index];
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.network(
                  product.image,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 45,
                  left: 16,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: kprimaryClr,
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (_) => const ShopPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    product.title,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.desc,
                    style: const TextStyle(fontSize: 16, color: kgrayClr),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${product.price.toString()}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _iconPressedList[widget.index] =
                            !_iconPressedList[widget.index];
                          });
                        },
                        child: Icon(
                          productData[widget.index].icon,
                          size: 32,
                          color: _iconPressedList[widget.index]
                              ? Colors.red
                              : ksecondaryClr,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _icon2PressedList[widget.index] =
                            !_icon2PressedList[widget.index];
                          });
                        },
                        child: Icon(
                          productData[widget.index].icon2,
                          size: 32,
                          color: _icon2PressedList[widget.index]
                              ? Colors.red
                              : ksecondaryClr,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
