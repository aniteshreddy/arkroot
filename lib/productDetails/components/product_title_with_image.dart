import 'package:arkroot/model/ProductList.dart';
import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatefulWidget {
  final ProductList productdetails;

  const ProductTitleWithImage({Key key, this.productdetails}) : super(key: key);
  @override
  _ProductTitleWithImageState createState() =>
      _ProductTitleWithImageState(productdetails);
}

class _ProductTitleWithImageState extends State<ProductTitleWithImage> {
  final ProductList _productdetails;

  _ProductTitleWithImageState(this._productdetails);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 200,
          margin: EdgeInsets.only(top: 16),
          child: Text(_productdetails.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 25)),
        ),
        Container(
            margin: EdgeInsets.only(top: 16),
            child: Row(children: <Widget>[
              Text.rich(
                TextSpan(
                  //text: 'This item costs ',
                  children: <TextSpan>[
                    new TextSpan(
                      text:" ₹ "+ _productdetails.variants[0].price,
                      style: new TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                      ),
                    ),
                   
                  ],
                ),
              ),
            ])),
        
      ],
    );
  }
}
