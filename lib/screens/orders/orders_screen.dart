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
      mainAxisAlignment:
          myOrders.isEmpty ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        if (myOrders.isNotEmpty)
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'My Orders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        if (myOrders.isEmpty)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Icon(Icons.hourglass_empty_rounded,size: 30,),
            ),
          ),
        if (myOrders.isEmpty)
          const Center(
            child: Text('No Orders placed yet!'),
          ),
        for (var item in myOrders) OrderItemss(order: item),
      ],
    );
  }
}
