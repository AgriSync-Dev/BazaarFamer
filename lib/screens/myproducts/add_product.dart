import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pirate_hunt/models/Product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late List<Product> temp;
  final _formKey = GlobalKey<FormState>();
  File? imageFile;
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

    _getFromGallery() async {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    }

    _getFromCamera() async {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    }

    void removeImg() {
      setState(() {
        imageFile = null;
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Product Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: imageFile == null
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.redAccent, // Background color
                                ),
                                onPressed: () {
                                  _getFromGallery();
                                },
                                child: const Text("Pick From Gallery"),
                              ),
                              Container(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.redAccent, // Background color
                                ),
                                onPressed: () {
                                  _getFromCamera();
                                },
                                child: const Text("Pick From Camera"),
                              )
                            ],
                          ),
                        )
                      : Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              radius: 120,
                              child: CircleAvatar(
                                radius: 115,
                                backgroundImage: Image.file(
                                  imageFile!,
                                  fit: BoxFit.cover,
                                ).image,
                              ),
                            ),
                            Positioned(
                              bottom: -2,
                              left: 160,
                              child: IconButton(
                                onPressed: removeImg,
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                nameField,
                const SizedBox(
                  height: 20,
                ),
                priceField,
                const SizedBox(
                  height: 20,
                ),
                descriptionField,
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    temp.add(
                      Product(
                        id: '123',
                        //image: imageFile,........................................
                        image: '1234',
                        title: _title.text,
                        price: int.parse(_price.text),
                        description: _description.text,
                      ),
                    );
                    //push data to firebase .................................................
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Add Product',
                      style: TextStyle(fontSize: 18),
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
