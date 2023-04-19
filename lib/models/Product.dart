import 'package:flutter/material.dart';

class Product {
  final String id, description;
  final String image, title;
  final int price;
  final Color bgColor;
  final String unit;
  final String category;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    this.bgColor = const Color(0xFFEFEFF2),
    required this.unit,
    required this.category,
  });
}

void addProduct(Product newProd) {
  demo_product.add(newProd);
}

List<Product> home_product = [
  Product(
    id: '1',
    image: "assets/20.jpeg",
    title: "Mango",
    price: 70,
    description: 'King of Fruits',
    bgColor: const Color(0xFFFEFBF9),
    unit: '1 kg',
    category: 'Fruits',
  ),
  Product(
    id: '2',
    image: "assets/21.jpeg",
    title: "Watermelon",
    price: 99,
    description: 'Juicy seasonal fruit',
    unit: '1 kg',
    category: 'Fruits',
  ),
  Product(
    id: '3',
    image: "assets/22.jpeg",
    title: "Tomato",
    price: 80,
    description: 'Ahh is it a fruit or a vegetable!',
    bgColor: const Color(0xFFF8FEFB),
    unit: '1 kg',
    category: 'Vegetables',
  ),
  Product(
    id: '4',
    image: "assets/23.jpeg",
    title: "Potato",
    price: 30,
    description: 'King of vegetables, Can go with anything',
    bgColor: const Color(0xFFEEEEED),
    unit: '1 kg',
    category: 'Vegetables',
  ),
];

List<Product> home_product1 = [
  Product(
    id: '3',
    image: "assets/22.jpeg",
    title: "Tomato",
    price: 80,
    description: 'Ahh is it a fruit or a vegetable!',
    bgColor: const Color(0xFFF8FEFB),
    unit: '1 kg',
    category: 'Vegetables',
  ),
  Product(
    id: '4',
    image: "assets/23.jpeg",
    title: "Potato",
    price: 30,
    description: 'King of vegetables, Can go with anything',
    bgColor: const Color(0xFFEEEEED),
    unit: '1 kg',
    category: 'Vegetables',
  ),
  Product(
    id: '1',
    image: "assets/20.jpeg",
    title: "Mango",
    price: 70,
    description: 'King of Fruits',
    bgColor: const Color(0xFFFEFBF9),
    unit: '1 kg',
    category: 'Fruits',
  ),
  Product(
    id: '2',
    image: "assets/21.jpeg",
    title: "Watermelon",
    price: 99,
    description: 'Juicy seasonal fruit',
    unit: '1 kg',
    category: 'Fruits',
  ),
];

List<Product> demo_product = [];
