import 'package:arkroot/Homepage/homepage.dart';
import 'package:arkroot/main.dart';
import 'package:arkroot/model/ProductList.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailsScreen extends StatefulWidget {
  final ProductList productid;
  final int index;
  final VoidCallback onClicked;

  const DetailsScreen({Key key, this.productid,@required this.index,@required this.onClicked}) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState(productid,index,onClicked);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final VoidCallback onClicked;
  final ProductList _productid;
  final int index;

  _DetailsScreenState(this._productid, this.index, this.onClicked);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.grey[300],
       appBar: AppBar(
        title:  Text("Products"),
        centerTitle: true,
        shape: CustomShapeBorder(),
      ),

      body: Body(
        productid: _productid,
        index:index,
        onClicked: onClicked,
      ),
    );
  }
}
