import 'package:flutter/material.dart';
import 'package:showcase_of_computer_components/components/category_model.dart';

class ProductModel {
  final String image, title, price, desc;
  final IconData icon, icon2;
  final CategoryModel category;

  ProductModel(
      {required this.image,
        required this.title,
        required this.price,
        required this.desc,
        required this.icon,
        required this.icon2,
        required this.category});
}