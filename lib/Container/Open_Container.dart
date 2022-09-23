import 'package:animations/animations.dart';

import 'package:flutter/material.dart';

class OpenContainerP1 extends StatefulWidget {
  const OpenContainerP1({Key? key}) : super(key: key);

  @override
  State<OpenContainerP1> createState() => _OpenState();
}

class _OpenState extends State<OpenContainerP1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Open Container ya raye2"),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OpenContainer(
            openColor: Colors.brown,
            transitionDuration: const Duration(seconds: 5),
            transitionType: ContainerTransitionType.fadeThrough,
            closedBuilder: (context, action) {
              return const Center(

                child: Text(
                  "Small_Box",
                  // style: TextStyle(fontSize: 32),
                ),
              );
            },
            openBuilder: (context, action) {
              return const Center(
                child: Text(
                  " صلّ  علي النبي ",
                  style: TextStyle(fontSize: 35),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

