import 'package:flutter/material.dart';
import 'package:pirate_hunt/models/Product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  List<Product> temp = [];
  TextEditingController _title = TextEditingController();
  TextEditingController _price = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _price.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Enter your Name'),
              SizedBox(
                height: 15,
              ),
              TextField(controller: _title),
              SizedBox(
                height: 15,
              ),
              Text('Enter the price of product'),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _price,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  temp.add(
                    Product(
                      id: '123',
                      image: '1234',
                      title: _title.text,
                      price: int.parse(_price.text),
                    ),
                  );
                },
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
