import 'package:arkroot/model/ProductList.dart';
import 'package:arkroot/productDetails/details_screen.dart';
import 'package:arkroot/components/screensize.dart';
import 'package:flutter/material.dart';

class ShoppingItemWidget extends StatelessWidget {
  final ProductList item;
  final Animation animation;
  final VoidCallback onClicked;
  final int index;

  const ShoppingItemWidget({
    @required this.item,
    @required this.animation,
    @required this.onClicked,
    @required this.index,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: animation,
        child: Container(
          height: getProportionateScreenHeight(80),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: new FileImage(item.image, scale: 1),
              radius: 30.0,
              child: Container(),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            title: Text(item.title, style: TextStyle(fontSize: 20)),
            subtitle: Text(item.companyName, style: TextStyle(fontSize: 12)),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return DetailsScreen(index: index,productid: item,onClicked: onClicked,);
              }));
            },
            onLongPress: onClicked,
          ),
        ),
      );
}
