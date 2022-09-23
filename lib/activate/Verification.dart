import 'package:flutter/material.dart';

import '../Sing.up/Sign_Up.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(

           height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment(0.8, 1),
                colors: [
                  Color(0xff4458DB),
                  Color(0xffB444DB),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Image.asset(
                    "assets/images/Logo White.png",
                    color: Colors.white,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(children: [
                        Center(
                          child: Container(
                            width: 280,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 310,
                            height: 300,
                            margin: const EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        Container(
                          height: 350,
                          width: 400,
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.fromLTRB(16.0, 32, 16, 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              // key: _formKey,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const Center(
                                      child: Text(
                                        "Verification",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Center(
                                      child: Text(
                                        "Enter Code Here",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          child: TextFormField(

                                            onSaved: (value) {},
                                          ),
                                        ),
                                         const SizedBox(width: 14,),
                                        Container(
                                          width: 20,
                                          child: TextFormField(


                                            onSaved: (value) {},
                                          ),
                                        ),  const SizedBox(width: 14,),
                                        Container(
                                          width: 20,
                                          child: TextFormField(


                                            onSaved: (value) {},
                                          ),
                                        ),  const SizedBox(width: 14,),
                                        Container(
                                          width: 20,
                                          child: TextFormField(


                                            onSaved: (value) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "If you didn't receive the code? ",
                                            style: TextStyle(color: Colors.black, fontSize: 12),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>const Sign_Up()),
                                                );
                                              },
                                              child:const Text("Redsend"))
                                        ],
                                      ),
                                    ),

                                  ]),
                            ),
                          ),
                        ),
                      ])),
                ],
              ),
            ),
          ),
        ));
  }
}
