// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constants.dart';
import '/screens/cart/components/cart_item.dart';
import '/providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    List<CartItem> myOrders = [];
    cartData.items.forEach(
      (key, value) => myOrders.add(value),
    );
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Shopping Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (cartData.itemCount == 0)
                const SizedBox(
                  height: 250,
                ),
              if (cartData.itemCount != 0)
                const SizedBox(
                  height: 7,
                ),
              if (cartData.itemCount == 0)
                const Center(
                    child: Text(
                  'No Items yet! C\'mon Buy something!',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                )),
              if (cartData.itemCount != 0)
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (context, i) {
                      return MyCartItem(
                          img: myOrders[i].img,
                          price: myOrders[i].price,
                          prodId: myOrders[i].id,
                          quantity: myOrders[i].quantity,
                          title: myOrders[i].title);
                    },
                    itemCount: cartData.items.length,
                  ),
                ),
              if (cartData.itemCount != 0)
                const Divider(
                  thickness: 2,
                ),
              if (cartData.itemCount != 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$${cartData.totalAmount}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Proceed to Payment',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cartData,
  }) : super(key: key);

  final Cart cartData;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      // textColor: Theme.of(context).primaryColor,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const Text('ORDER NOW'),
    );
  }
}
