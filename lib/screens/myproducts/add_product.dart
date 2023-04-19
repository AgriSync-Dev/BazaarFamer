import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pirate_hunt/models/Product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late List<Product> temp;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  void initState() {
    temp = [];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _price.dispose();
    _description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      controller: _title,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your name!");
        }
        return null;
      },
      keyboardType: TextInputType.name,
      onSaved: (val) {
        _title.text = val!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final descriptionField = TextFormField(
      maxLines: 5,
      minLines: 5,
      autofocus: false,
      controller: _description,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter the description!");
        }
        return null;
      },
      keyboardType: TextInputType.text,
      onSaved: (val) {
        _description.text = val!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.description),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Product Description",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final priceField = TextFormField(
      autofocus: false,
      controller: _price,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter price of product!");
        }
        return null;
      },
      keyboardType: TextInputType.number,
      onSaved: (val) {
        _price.text = val!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.attach_money),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Price",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                nameField,
                const SizedBox(
                  height: 15,
                ),
                priceField,
                const SizedBox(
                  height: 15,
                ),
                descriptionField,
                const SizedBox(
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
                        description: _description.text,
                      ),
                    );
                    //push data to firebase .................................................
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Add Product',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
