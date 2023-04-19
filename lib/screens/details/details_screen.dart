import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/cart.dart';
import '/screens/cart/cart_screen.dart';
import '/constants.dart';
import '/models/Product.dart';
import 'components/color_dot.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late var _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.product.bgColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: CircleAvatar(
        //       backgroundColor: Colors.white,
        //       child: SvgPicture.asset(
        //         "assets/icons/Heart.svg",
        //         height: 20,
        //       ),
        //     ),
        //   )
        // ],
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            widget.product.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        "Rs ${widget.product.price}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Text(widget.product.description)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Unit",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        'Quantity',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // const ChoiceColors(),
                      Text(widget.product.unit),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_quantity == 0) {
                                  return;
                                }
                                _quantity--;
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            _quantity.toString(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _quantity++;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _quantity == 0
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();
                                  Provider.of<Cart>(context, listen: false)
                                      .addItem(
                                          widget.product.id,
                                          widget.product.price,
                                          widget.product.title,
                                          _quantity);
                                },
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: const StadiumBorder()),
                          child: const Text("Add to Cart"),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _quantity == 0
                              ? null
                              : () {
                                  Provider.of<Cart>(context, listen: false)
                                      .addItem(
                                          widget.product.id,
                                          widget.product.price,
                                          widget.product.title,
                                          _quantity);

                                  FocusScope.of(context).unfocus();
                                  Navigator.of(context).pushReplacementNamed(
                                      CartScreen.routeName);
                                },
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: const StadiumBorder()),
                          child: const Text("Buy Now"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChoiceColors extends StatefulWidget {
  const ChoiceColors({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoiceColors> createState() => _ChoiceColorsState();
}

class _ChoiceColorsState extends State<ChoiceColors> {
  bool i = false, j = false, k = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              i = true;
              j = false;
              k = false;
            });
          },
          child: ColorDot(
            color: const Color(0xFFBEE8EA),
            isActive: i,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              i = false;
              j = true;
              k = false;
            });
          },
          child: ColorDot(
            color: const Color(0xFF141B4A),
            isActive: j,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              i = false;
              j = false;
              k = true;
            });
          },
          child: ColorDot(
            color: const Color(0xFFF4E5C3),
            isActive: k,
          ),
        ),
      ],
    );
  }
}
