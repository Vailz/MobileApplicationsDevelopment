import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:showcase_of_computer_components/data/product_data.dart';
import 'package:showcase_of_computer_components/data/category_data.dart';
import 'package:showcase_of_computer_components/my_icons_icons.dart';
import 'package:showcase_of_computer_components/utils/colors.dart';
import 'package:showcase_of_computer_components/product_page.dart';
import 'package:showcase_of_computer_components/save_page.dart';
import 'package:showcase_of_computer_components/components/category_card.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({Key? key}) : super(key: key);

  @override
  _ProductSectionState createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  List<bool> _iconPressedList = List.filled(productData.length, false);
  List<bool> _icon2PressedList = List.filled(productData.length, false);
  List<int> _selectedProducts = [];
  List<int> _savedProducts = [];


  void _addToSavedProducts(int index) {
    setState(() {
      _savedProducts.add(index);
    });
  }

  void _addToSelectedProducts(int index) {
    setState(() {
      _selectedProducts.add(index);
    });
  }

  void _removeFromSelectedProducts(int index) {
    setState(() {
      _selectedProducts.remove(index);
    });
  }

  bool _isProductSelected(int index) {
    return _selectedProducts.contains(index);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0.0),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: productData.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        itemBuilder: (context, index) {
          final filteredProductData = productData.where((product) => product.category == productData[index].category).toList();
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(index: index),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: lightGrayClr,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          productData[index].image,
                          height: 200,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _iconPressedList[index] =
                                !_iconPressedList[index];
                                if (_isProductSelected(index)) {
                                  _removeFromSelectedProducts(index);
                                } else {
                                  _addToSelectedProducts(index);
                                }
                              });
                            },
                            child: Icon(
                              productData[index].icon,
                              color: _iconPressedList[index]
                                  ? Colors.red
                                  : ksecondaryClr,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _icon2PressedList[index] =
                                !_icon2PressedList[index];
                              });
                            },
                            child: Icon(
                              productData[index].icon2,
                              color: _icon2PressedList[index]
                                  ? Colors.red
                                  : ksecondaryClr,
                            ),
                          ),
                        ],
                      ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    productData[index].title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    productData[index].desc,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 11, color: kgrayClr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    productData[index].price,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kgrayClr),
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
