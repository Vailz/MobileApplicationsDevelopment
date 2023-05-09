import 'package:flutter/material.dart';
import 'package:showcase_of_computer_components/components/product_section.dart';
import 'package:showcase_of_computer_components/components/category_card.dart';

import 'package:showcase_of_computer_components/utils/colors.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filterProducts(String searchText) {
    setState(() {
      _searchText = searchText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Column(
        children: [
        Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10),
    child: Text(
    'TechSpot',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: kprimaryClr,
    ),
    ),
    ),
    SizedBox(height: 25),
    Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(
    children: [
    TextFormField(
    controller: _searchController,
    cursorColor: kprimaryClr,
    decoration: InputDecoration(
    filled: true,
    fillColor: lightGrayClr,
    border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(5),
    ),
    hintText: "Поиск",
    prefixIcon: Icon(Icons.search, color: kprimaryClr),
    ),
    onChanged: filterProducts,
    ),
    ],
    ),
    ),
          const SizedBox(
            height: 15,
          ),
          const CategoryCard(),
          const SizedBox(
            height: 15,
          ),
    //Все товары
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: const [
    Text(
    'Витрина товаров',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    ),
    ),
    ],
    ),
    ),
    const SizedBox(
    height: 15,
    ),
//Карточки товаров
          Expanded(
            child: ProductSection(),
          ),
        ],
        ),
        ),
    );
  }
}