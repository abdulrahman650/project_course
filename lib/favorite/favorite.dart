import 'package:flutter/material.dart';

import '../menu/menu.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: ElevatedButton(onPressed: (){
          Navigator.push(
            context, MaterialPageRoute(builder:((context){
            return const Menu();
          }
          )
          ),
          );
        },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),elevation: MaterialStateProperty.all(0)),child: Image.asset("assets/Side Manu Arrow.png",),),
        title: const Text("Favorite",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset("assets/searching-magnifying-glass-1.png",width: 14,height: 14,),
          )
        ],
      ),
      body:  const Center(child: Text("No Favourites",style: TextStyle(fontWeight: FontWeight.bold),)),
     // Center(child: Text("No Favorites")),
    );
  }
}
