import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pirate_hunt/models/Product.dart';
import 'package:pirate_hunt/models/Product.dart';
import 'package:pirate_hunt/screens/home/home_screen.dart';

import '../../models/Product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  File? imageFile;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _unit = TextEditingController();
  final List<String> items = [
    'Vegetables',
    'Fruits',
    'Grains',
    'Dairy',
  ];
  String selectedValue = 'Vegetables';

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _price.dispose();
    _description.dispose();
    _unit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isNumeric(String s) {
      if (s == null) {
        return false;
      }
      return double.tryParse(s) != null;
    }

    final nameField = TextFormField(
      autofocus: false,
      controller: _title,
      validator: (value) {
        if (value!.isEmpty || isNumeric(value)) {
          return ("Please enter a valid Product name!");
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

    final unitField = TextFormField(
      autofocus: false,
      controller: _unit,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter the product unit!");
        }
        return null;
      },
      keyboardType: TextInputType.name,
      onSaved: (val) {
        _unit.text = val!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.ac_unit),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Unit",
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
        if (value!.isEmpty || int.parse(value) <= 0) {
          return ("Please enter a valid price of product!");
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
                unitField,
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        Icon(
                          Icons.list,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Select Item',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 160,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.blueAccent,
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_downward_outlined,
                      ),
                      iconSize: 18,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      padding: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.blueAccent,
                      ),
                      elevation: 8,
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                descriptionField,
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && imageFile != null) {
                      demo_product.add(
                        Product(
                          id: (demo_product.length + 1).toString(),
                          image: imageFile!.path,
                          title: _title.text,
                          price: int.parse(_price.text),
                          description: _description.text,
                          unit: _unit.text,
                          category: selectedValue,
                        ),
                      );
                      //print(demo_product[demo_product.length - 1].image);
                      // Navigator.of(context).popUntil((route) => false)
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .popAndPushNamed(SecondHomeScreen.routeName);
                    }

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
