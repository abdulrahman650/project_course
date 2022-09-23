import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../favorite/favorite.dart';
import '../menu/menu.dart';
import '../single_listing/single_listing.dart';
import '../tour/tour.dart';
import 'location.dart';

class Convex extends StatefulWidget {
  const Convex({Key? key}) : super(key: key);

  @override
  State<Convex> createState() => _ConvexState();
}

class _ConvexState extends State<Convex> {
 int currentIndex = 2;
  List<Widget> opetions = <Widget>[
    Tour(),
    const Favorite(),
    const Location(),
    Single_Listing(),
    const Menu(),
  ];

  void changeItem(int value){
    setState((){
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: opetions.elementAt(currentIndex),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          items: const [
            TabItem(icon: Image(image: AssetImage("assets/home.png"),),),
            TabItem(icon: Image(image: AssetImage("assets/heart.png"),),),
            TabItem(icon: Image(image: AssetImage("assets/Suitcase.png",),fit: BoxFit.fill,),),
            TabItem(icon: Image(image: AssetImage("assets/Calendar.png"),),),
            TabItem(icon: Image(image: AssetImage("assets/avatar.png"),),),
          ],
          initialActiveIndex: currentIndex,
          onTap: changeItem,
          backgroundColor: Colors.white,
          color: Colors.black,
        )
    );
  }
}













