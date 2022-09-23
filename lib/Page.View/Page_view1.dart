import 'package:flutter/material.dart';

import 'Model_Page.View.dart';
import '../Sign.in/Sign_in.dart';
import '../Sing.up/Sign_Up.dart';

class Page_View1 extends StatefulWidget {
  const Page_View1({Key? key}) : super(key: key);

  @override
  State<Page_View1> createState() => _Page_View1State();
}

class _Page_View1State extends State<Page_View1> {
  final controller = OnBoardingController();

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/images/Logo Color home.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 800,
              child: PageView(
                onPageChanged: (value) {
                  controller.currentPage = value;
                  setState(() {});
                },
                children: List.generate(
                  controller.model.length,
                  (index) => SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          controller.model[controller.currentPage].image,
                          height: 350,
                          width: 400,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          controller.model[controller.currentPage].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 28,
                              color: Color(0xff4A4B4D),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        Text(
                          controller.model[controller.currentPage].subtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 13, color: const Color(0xff7C7D7E)),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        controller.currentPage == controller.model.length - 1
                            ? TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Sign_in()),
                                  );
                                },
                                child: const Text(
                                  "Let's go!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xff4458DB)),
                                ))
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  Sign_in()),
                                        );
                                        setState(() {});
                                      },
                                      child: const Text(
                                        "Skip",
                                        style: TextStyle(color: Colors.grey),
                                      )),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(
                                        controller.model.length,
                                        (index) => Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .only(end: 5),
                                              child: CircleAvatar(
                                                radius: 3,
                                                backgroundColor: Color(index ==
                                                        controller.currentPage
                                                    ? 0xff4458DB
                                                    : 0xffD6D6D6),
                                              ),
                                            )),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        if (controller.currentPage <
                                            (controller.model.length - 1)) {
                                          controller.currentPage++;
                                          setState(() {});
                                        }
                                      },
                                      child:  const Text(
                                        "Next",
                                        style: TextStyle(color: Colors.grey),
                                      )),
                                ],
                              ),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
