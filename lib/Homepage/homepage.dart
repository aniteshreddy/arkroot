import 'package:arkroot/Homepage/listWidget.dart';
import 'package:arkroot/components/screensize.dart';
import 'package:arkroot/model/ProductList.dart';
import 'package:arkroot/uploadProducts/uploadMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {


  @override
  MainPageState createState() => MainPageState();

}

class MainPageState extends State<MainPage> {
  static GlobalKey<AnimatedListState> animatedKey = GlobalKey<AnimatedListState>();
  static List<ProductList> items = [];
  @override
  initState() {
    super.initState();
    setState(() {
      items = items;
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "ARKROOT",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Container(
          padding: EdgeInsets.all(16),
          width: 15,
          height: 15,
          child: SvgPicture.asset(
            "assets/menu.svg",
            height: 15,
            width: 15,
            color: Colors.white,
          ),
        ),
        shape: CustomShapeBorder(),
        actions: [
          Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(16)),
              child: Icon(
                Icons.notifications,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return UploadMain( onClicked: () => removeItem(0),index: 0,);
          }));
        },
        child: Icon(Icons.add),
      ),
      body: items.length == 0
          ? Center(
              child: Text(
              "Add products in to the Application",
              style: TextStyle(fontSize: getProportionateScreenWidth(20)),
            ))
          : Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                Expanded(
                  child: AnimatedList(
                    key: animatedKey,
                    initialItemCount: items.length,
                    itemBuilder: (context, index, animation) =>
                        buildItem(items[index], index, animation),
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildItem(item, int index, Animation<double> animation) =>
      ShoppingItemWidget(
        item: item,
        animation: animation,
        onClicked: () => removeItem(index),
        index: index,
      );

  void insertItem(int index, ProductList item) {
    items.insert(index, item);
    animatedKey.currentState.insertItem(index);
  }

  void removeItem(int index) {
    final item = items.removeAt(index);

    animatedKey.currentState.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),
    );
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path path = Path();
    path.lineTo(0, rect.height + 40);
    path.conicTo(0, rect.height, rect.width / 6, rect.height, 1.5);
    path.lineTo(rect.width - (rect.width / 6), rect.height);
    path.conicTo(rect.width, rect.height, rect.width, rect.height + 40, 1.5);
    path.lineTo(rect.width, 0);
    path.close();

    return path;
  }
}
