import 'package:arkroot/Homepage/homepage.dart';
import 'package:arkroot/model/ProductList.dart';
import 'package:arkroot/components/screensize.dart';
import 'package:arkroot/components/popUp.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Uploaddetails extends StatefulWidget {
  final ProductList productList;
  final int index;
  final VoidCallback onClicked;
  const Uploaddetails(
      {Key key,
      this.productList,
      @required this.index,
      @required this.onClicked})
      : super(key: key);
  @override
  _UploaddetailsState createState() =>
      _UploaddetailsState(productList, index, onClicked);
}

class _UploaddetailsState extends State<Uploaddetails> {
  final ProductList productList;
  final int index;
  final VoidCallback onClicked;
  _UploaddetailsState(this.productList, this.index, this.onClicked);
  TextEditingController _name,
      _category,
      _description,
      _price,
      _model,
      _dimension,
      _type,
      _colour,
      _brand;

  File _image;
  final picker = ImagePicker();

  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image selected");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _category = TextEditingController();
    _description = TextEditingController();
    _price = TextEditingController();
    _brand = TextEditingController();
    _colour = TextEditingController();
    _dimension = TextEditingController();
    _model = TextEditingController();
    _type = TextEditingController();

    print(productList);
    print(index);
    if (productList != null) {
      _name.text = productList.title;

      _brand.text = productList.companyName;

      _description.text = productList.description;
      _dimension.text = productList.dimensions;

      _type.text = productList.type;
      _description.text = productList.description;
      _colour.text = productList.variants[0].color;
      _model.text = productList.variants[0].model;
      _price.text = productList.variants[0].price;
      _image = productList.image;
    }
  }

  void dispose() {
    _category.dispose();
    _name.dispose();
    _description.dispose();
    _price.dispose();
    _brand.dispose();
    //_image.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          // margin: EdgeInsets.all(getProportionateScreenWidth(20)),
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(12),
                    vertical: getProportionateScreenWidth(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),
                    AutoSizeTextField(
                      controller: _name,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          labelText: "Product Name",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),
                    AutoSizeTextField(
                      controller: _dimension,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          labelText: "Dimensions",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),
                    AutoSizeTextField(
                      controller: _type,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          labelText: "Type",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),
                    AutoSizeTextField(
                      controller: _brand,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          labelText: "Company name",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),
                    AutoSizeTextField(
                      controller: _description,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          labelText: "Description",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),
                    AutoSizeTextField(
                      controller: _price,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          labelText: "Price",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),
                    AutoSizeTextField(
                      controller: _colour,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          labelText: "Colour",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),
                    AutoSizeTextField(
                      controller: _model,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          labelText: "Model",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Upload images",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.upload_file,
                              size: 30.0,
                            ),
                            onPressed: () {
                              _getImage();
                            }),
                        _image == null
                            ? Text("")
                            : Container(
                                width: getProportionateScreenWidth(80.0),
                                child: Image.file(_image),
                              )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(35.0),
                    ),
                    InkWell(
                      onTap: () {
                        if (productList != null &&
                            _name.text != "" &&
                            _colour.text != "" &&
                            _description.text != "" &&
                            _type.text != "" &&
                            _image != null &&
                            _brand.text != "" &&
                            _price.text != "" &&
                            _model.text != "" &&
                            _dimension.text != "") {
                          onClicked();

                          insertItem(
                              index,
                              ProductList(
                                title: _name.text,
                                companyName: _brand.text,
                                description: _description.text,
                                dimensions: _dimension.text,
                                type: _type.text,
                                // urlImage: '',
                                image: _image,
                                variants: [
                                  Variant(
                                      price: _price.text,
                                      model: _model.text,
                                      color: _colour.text)
                                ],
                              ));
                        } else if (_name.text != "" &&
                            _colour.text != "" &&
                            _description.text != "" &&
                            _type.text != "" &&
                            _image != null &&
                            _brand.text != "" &&
                            _price.text != "" &&
                            _model.text != "" &&
                            _dimension.text != "") {
                          insertItem(
                              0,
                              ProductList(
                                title: _name.text,
                                companyName: _brand.text,
                                description: _description.text,
                                dimensions: _dimension.text,
                                type: _type.text,
                                // urlImage: '',
                                image: _image,
                                variants: [
                                  Variant(
                                      price: _price.text,
                                      model: _model.text,
                                      color: _colour.text)
                                ],
                              ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialogBox(
                                    title: "Warning!",
                                    descriptions:
                                        "Fill all fields to save the product",
                                    image: "assets/Error.svg");
                              });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(12.0),
                            vertical: getProportionateScreenHeight(6.0)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Text(
                          "Upload",
                          style: TextStyle(fontSize: 24.0, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
          )),
    );
  }

  void insertItem(int index, ProductList item) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => MainPage()),
        (Route<dynamic> route) => false);
    MainPageState.items.insert(index, item);

    MainPageState.animatedKey.currentState
        .insertItem(index, duration: const Duration(seconds: 1));
  }
}
