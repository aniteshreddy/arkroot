import 'dart:io';

import 'package:meta/meta.dart';

class ProductList {
  final String title;
  // final String urlImage;
  final String dimensions;
  final String type;
  final String companyName;
  final String description;
  final List<Variant> variants;
  final File image;

  ProductList(
      {@required this.title,
      // @required this.urlImage,
      @required this.dimensions,
      @required this.type,
      @required this.companyName,
      @required this.description,
      @required this.variants,
      @required this.image});
}

class Variant {
  final String price;
  final String model;
  final String color;

  Variant({@required this.price, @required this.model, @required this.color});
}
