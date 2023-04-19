import '/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyCartItem extends StatefulWidget {
  final String prodId;
  final String title;
  int quantity;
  final int price;
  final String img;
  MyCartItem({
    required this.img,
    required this.price,
    required this.prodId,
    required this.quantity,
    required this.title,
  });

  @override
  State<MyCartItem> createState() => _MyCartItemState();
}

class _MyCartItemState extends State<MyCartItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue[100],
          ),
          width: double.infinity,
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 110,
                width: 110,
                child: Image.asset(
                  widget.img,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Price: Rs ${widget.price}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Quantity:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (widget.quantity == 0) {
                              return;
                            }
                            widget.quantity--;
                            Provider.of<Cart>(context, listen: false)
                                .update(widget.prodId, widget.quantity);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.remove),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.quantity.toString(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.quantity++;
                          });
                          Provider.of<Cart>(context, listen: false)
                              .update(widget.prodId, widget.quantity);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 50,
          right: 10,
          child: IconButton(
            onPressed: () {
              Provider.of<Cart>(context, listen: false)
                  .removeItem(widget.prodId);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}