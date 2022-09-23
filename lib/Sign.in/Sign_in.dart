import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Container/Open_Container.dart';
import '../Provider_Singin/Sign_in_resopnse.dart';


import '../Sing.up/Sign_Up.dart';

class Sign_in extends StatefulWidget {


  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  bool isLoading = false;
  bool isPassword= true;
  String? token;

  final _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(

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
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.fromLTRB(16.0, 32, 16, 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 14,),
                                const Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(hintText: "Email"),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !value.contains("@")) {
                                      return "Enter Valid Email";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {},
                                ),
                                const SizedBox(height: 20,),
                                TextFormField(
                                  controller: password,
                                  decoration: InputDecoration(hintText: "Password"),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty) {
                                      return "Enter Valid Password";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    setState((){

                                    });
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child: const Text(
                                        "Forget Password ?",
                                        style: TextStyle(
                                          color: Color(0xff4458DB),
                                        ),
                                      ),
                                      onPressed: () {
                                        // Navigator.push(context,
                                        //   MaterialPageRoute(builder: (context) => ForgetPassword()),);
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(width: double.infinity,
                                  child: Container(
                                    width: 250,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff4458DB),
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                         isLoading? Center(child:   CircularProgressIndicator(),):TextButton(
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    _formKey.currentState!.save();
                                                    login(
                                                      email: email.text,
                                                      password: password.text
                                                    );
                                                    print(email.text);
                                                    print(password.text);
                                                  }
                                                },
                                                child: const Text(
                                            "SignIn",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[700],
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    "assets/images/right-arrow.png",
                                                    color: Colors.white,
                                                  ),
                                                ))),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ])),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Facebook.png",
                    width: 50,
                    height: 200,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/images/Google.png",
                    width: 50,
                    height: 50,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Text(
                    "Don't have an account ? ",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>const Sign_Up()),
                        );
                      },
                      child:const Text("Sing Up"))
                ],
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    ));
  }
    Future login({required email,required password}) async{
    setState((){
      isLoading = true;
    });
    Response loginResopnse = await post(Uri.parse("http://alcaptin.com/api/login"),
        headers: {
          "Accept": "application/json",
          "Authorization":"Bearer $token"
        },
        body: {
          "email": email,
          "password": password,
        });

    dynamic convertedJson = jsonDecode(loginResopnse.body);
    print(loginResopnse.body);

    if (loginResopnse.statusCode == 200) {
      SignInResopnse userData = SignInResopnse.fromJson(convertedJson);
      print(" Welcome ${userData.data}");
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenContainerP1()));
    } else {
      print(convertedJson["message"]);
    }


    setState(() {
      isLoading = false;
    });

  }
}
