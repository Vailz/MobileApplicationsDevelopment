import 'package:showcase_of_computer_components/components/product_model.dart';
import 'package:showcase_of_computer_components/components/category_model.dart';
import 'package:showcase_of_computer_components/components/category_card.dart';
import 'package:showcase_of_computer_components/data/category_data.dart';
import 'package:showcase_of_computer_components/my_icons_icons.dart';
import 'package:flutter/material.dart';

List categoryData = [
  CategoryModel(
    title: 'Все товары',
    active: false,
  ),
  CategoryModel(
    title: "ОЗУ",
    active: false,
  ),
  CategoryModel(
    title: "Процессоры",
    active: true,
  ),
  CategoryModel(
    title: "Корпусы",
    active: false,
  ),
];

List productData = [
  ProductModel(
    image:
    "https://c.dns-shop.ru/thumb/st4/fit/500/500/c5c22f3208408f3114077ba5b24d22d8/a3c90a0d5430316efabbd7d82e33d38ca0ad15b6a317c7b60b1a14b3516a10e4.jpg.webp",
    title: "Видеокарта ASUS ROG Strix GeForce RTX 3090",
    price: "\₽202 999 ",
    icon: MyIcons.vector_3,
    icon2: MyIcons.vector,
    desc: 'PCI-E 4.0 24 ГБ GDDR6X, 384 бит, DisplayPort x3, HDMI x2, GPU 1400 МГц',
    category: categoryData[1],
  ),
  ProductModel(
    image:
    "https://c.dns-shop.ru/thumb/st1/fit/500/500/7a8b85c929f31c8b24bea044226ffa95/519181c26cb63cd22fe132010f92a7a3a70e8bd43d2a9a3e6c21e7f113c124d4.jpg.webp",
    title: "Процессор AMD Ryzen Threadripper PRO 5995WX OEM",
    price: "\₽672 999",
    icon: MyIcons.vector_3,
    icon2: MyIcons.vector,
    desc: 'sWRX8, 64 x 2.7 ГГц, L2 - 32 МБ, L3 - 256 МБ, 8хDDR4-3200 МГц, TDP 280 Вт',
    category: categoryData[1],
  ),
  ProductModel(
    image:
    "https://c.dns-shop.ru/thumb/st1/fit/500/500/1a7c47f30a7484df4663ade8740c5b8f/5d1389e0c203ac82f8c970bbbcb99fa899a5f6a1879a5c7a3b5627f442043878.jpg.webp",
    title: "Корпус Fractal Design Torrent RGB White TG",
    price: "\₽31 999",
    icon: MyIcons.vector_3,
    icon2: MyIcons.vector,
    desc: 'Full-Tower, E-ATX, Micro-ATX, Mini-ITX, SSI-CEB, USB 3.2 Gen1 Type-A, USB 3.2 Gen2 Type-C',
    category: categoryData[1],
  ),
  ProductModel(
    image:
    "https://c.dns-shop.ru/thumb/st1/fit/500/500/f1efabf02f5c2508fde15bd179b10fd7/4bdc5b9577a2631571957cb64876fd9ddb8a6a36cb056b23821bfd38cc932716.jpg.webp",
    title: "Видеокарта MSI GeForce RTX 4090 SUPRIM X",
    price: "\₽175 999",
    icon: MyIcons.vector_3,
    icon2: MyIcons.vector,
    desc: 'PCI-E 4.0 24 ГБ GDDR6X, 384 бит, DisplayPort x3, HDMI, GPU 2235 МГц',
    category: categoryData[1],
  ),
  ProductModel(
    image:
    "https://c.dns-shop.ru/thumb/st4/fit/500/500/a5c2164b4bdca0e86b24eda4d78cf4e8/10b2083bf1dd63694dcc5bd95c341152ec0517eefc19fa43f702ab5b0c409b71.png.webp",
    title: "Оперативная память ADATA XPG Lancer RGB",
    price: "\₽29 999",
    icon: MyIcons.vector_3,
    icon2: MyIcons.vector,
    desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
    category: categoryData[2],
  ),
  ProductModel(
    image:
    "https://c.dns-shop.ru/thumb/st4/fit/500/500/b4b93c11758ee6382e7625230904ddbc/eade80e798a0d7e6a36d2f7316ba6ad27ad2b6f5947241f74ee2ff2315c0c9de.jpg.webp",
    title: "Процессор Intel Core i9-10980XE BOX",
    price: "\₽96 799",
    icon: MyIcons.vector_3,
    icon2: MyIcons.vector,
    desc: 'LGA 2066, 18 x 3 ГГц, L2 - 18 МБ, L3 - 25.75 МБ, 4хDDR4-2933 МГц, TDP 165 Вт',
    category: categoryData[3],
  ),
];