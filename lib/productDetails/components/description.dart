import 'package:arkroot/model/ProductList.dart';
import 'package:arkroot/components/screensize.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final ProductList productdetails;

  Description({Key key, this.productdetails}) : super(key: key);

  Widget getDetails(String heading, String data) {
    return Row(children: <Widget>[
      Text(
        "$heading :   ",
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        maxLines: 8,
        style: TextStyle(height: 1.5, fontWeight: FontWeight.bold),
      ),
      Text(
        "  $data",
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        maxLines: 8,
        style: TextStyle(height: 1.5),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(16)),
          getDetails("Company Name", productdetails.companyName),
          SizedBox(height: getProportionateScreenHeight(16)),
          getDetails("Color", productdetails.variants[0].color),
          SizedBox(height: getProportionateScreenHeight(16)),
          getDetails("Model", productdetails.variants[0].model),
          SizedBox(height: getProportionateScreenHeight(16)),
          getDetails("Dimensions", productdetails.dimensions),
          SizedBox(height: getProportionateScreenHeight(16)),
          getDetails("Type", productdetails.type),
          SizedBox(height: getProportionateScreenHeight(16)),
          getDetails("Description", productdetails.description)
        ]);
  }
}
