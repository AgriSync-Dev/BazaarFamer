import 'package:flutter/material.dart';
import './cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pirate_hunt/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.amount,
    required this.dateTime,
    required this.id,
    required this.products,
  });
}

class Orders with ChangeNotifier {
  // var timeStamp=DateTime.now();
  late List<OrderItem> _orders = [
    // OrderItem(
    //   amount: 12.67,
    //   dateTime: DateTime.now(),
    //   id: "1",
    //   products: [
    //     CartItem(
    //       id: "0",
    //       title: "Luffy Hat",
    //       quantity: 1,
    //       price: 12.67,
    //       size: "S",
    //     ),
    //   ],
    // ),
  ];

  // Orders(this.authToken,this._orders,this.userId);

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    final timeStamp = DateTime.now();

    _orders.insert(
      0,
      OrderItem(
        amount: total,
        dateTime: timeStamp,
        id: timeStamp.toIso8601String(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}