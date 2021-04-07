import 'package:arkroot/components/screensize.dart';
import 'package:arkroot/model/ProductList.dart';
import 'package:arkroot/uploadProducts/uploadProduct.dart';
import 'package:flutter/material.dart';


class UploadMain extends StatelessWidget {
  final ProductList productList;
  final int index;
  final VoidCallback onClicked;

  const UploadMain({Key key, this.productList,@required this.index,@required this.onClicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: Text(
          "Enter Product details",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            CustomPaint(
              painter: LinePainter(),
              size: Size(SizeConfig.screenWidth, SizeConfig.screenHeight / 4),
            ),
            SizedBox(
              // height: getProportionateScreenHeight(15),
              child: Uploaddetails(
              index:  index,productList: productList,onClicked: onClicked,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepOrange;
    paint.style = PaintingStyle.fill;
    canvas.drawRect(Offset(0, 0) & Size(SizeConfig.screenWidth, 130), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}