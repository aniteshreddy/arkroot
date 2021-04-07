import 'package:arkroot/components/screensize.dart';
import 'package:arkroot/model/ProductList.dart';
import 'package:arkroot/uploadProducts/uploadMain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatefulWidget {
  final ProductList productid;
  final int index;
  final VoidCallback onClicked;

  const Body({Key key, this.productid, this.index, @required this.onClicked}) : super(key: key);
  @override
  _BodyState createState() => _BodyState(productid, index,onClicked);
}

class _BodyState extends State<Body> {
  final ProductList productid;
  final int index;
  final VoidCallback onClicked;
  _BodyState(this.productid, this.index, this.onClicked);

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size * 1.3;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: size.height / 1.2,
            child: Stack(
              children: <Widget>[
                Container(
                    height: size.height * 0.22,
                    width: size.width,
                    child: Image.file(
                      productid.image,
                      fit: BoxFit.cover,
                    )),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.2),
                  padding: EdgeInsets.only(
                    top: size.height * 0.005,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      // CounterWithFavBtn(),
                      ProductTitleWithImage(
                        productdetails: productid,
                      ),

                      //ColorAndSize(product: product),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      Description(
                        productdetails: productid,
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),

                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return UploadMain(
                                productList: productid,
                                index: index,
                                onClicked: onClicked,
                              );
                            }));
                          },
                          child: Container(
                            width: getProportionateScreenWidth(160),
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(12.0),
                                vertical: getProportionateScreenHeight(6.0)),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Text(
                              "Edit Listing",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
