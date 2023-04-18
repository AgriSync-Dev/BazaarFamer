import 'package:flutter/material.dart';
import 'package:pirate_hunt/providers/cart.dart';
import 'package:pirate_hunt/providers/order.dart';
import 'package:pirate_hunt/screens/orders/components/order_itemss.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    List<OrderItem> myOrders = ordersData.orders;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'My Orders',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        for (var item in myOrders) OrderItemss(order: item),
      ],
    );
  }
}
