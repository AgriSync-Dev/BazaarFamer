import '/models/Product.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final String img;
  final int price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.img,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    int total = 0;
    _items.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cart) {
      total += cart.price * cart.quantity;
    });
    return total;
  }

  void update(String id, int q) {
    _items.update(
      id,
      (value) => CartItem(
        id: value.id,
        title: value.title,
        quantity: q,
        price: value.price,
        img: value.img,
      ),
    );
    notifyListeners();
  }

  void addItem(String productId, int price, String title, int q) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity + q,
          price: value.price,
          img: value.img,
        ),
      );
    } else {
      Product p = demo_product.firstWhere((element) => element.id == productId);
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: productId,
          title: title,
          quantity: q,
          price: price,
          img: p.image,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}