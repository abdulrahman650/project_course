import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Container/Open_Container.dart';
import '../activate/Verification.dart';
import '../signup_response/Signup_response.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  bool agreement = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  bool isLoading = false;
  bool isPassword= true;
  String? token;
  final _formKey =GlobalKey<FormState>();

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
                height: 15,
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
                      // padding: const EdgeInsets.all(18.0),
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
                        key : _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 14,
                              ),
                              const Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: name,
                                decoration: const InputDecoration(hintText: "Name"),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                  return null;
                                },
                                onChanged: (value){
                                  setState((){});
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: email,
                                decoration: const InputDecoration(hintText: "Email"),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty) {
                                    return "Enter Valid Email";
                                  }
                                  return null;
                                },
                                onChanged: (value){
                                  setState((){});
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: password,
                                decoration: const InputDecoration(hintText: "Password"),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty) {
                                    return "Enter Valid Password";
                                  }
                                  return null;
                                },
                                onChanged: (value){
                                  setState((){});
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: age,
                                decoration: const InputDecoration(hintText: "Age"),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty) {
                                    return "Enter Valid Age";
                                  }
                                  return null;
                                },
                                onChanged: (value){
                                  setState((){});
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                  leading: Container(
                                    width: 2,
                                    child: Checkbox(
                                      value: agreement,
                                      onChanged: (value) {
                                        setState(() {
                                          agreement = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  title: Transform.translate(
                                    offset: Offset(-35, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "I agree the ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          " Teams & Conditions",
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 12),
                                        )
                                      ],
                                    ),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Container(
                                  width: 250,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xff4458DB),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                        if (_formKey.currentState!
                                            .validate()) {
                                          _formKey.currentState!.save();
                                          regester(
                                              email: email.text,
                                              password: password.text,
                                              name:name.text,
                                            age: age.text
                                          );
                                          print(email.text);
                                          print(password.text);
                                        }
                                      },
                                        child: Text(
                                          "Sign Up",
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
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Facebook.png",
                      width: 50,
                      height: 100,
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
              ),
              // const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Already have n ccount? Login",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
  Future regester({required email,required password,required name,required age,}) async{
    setState((){
      isLoading = true;
    });
    Response regesterResopnse= await post(Uri.parse("http://alcaptin.com/api/register"),
        headers: {
          "Accept": "application/json",
          "Authorization":"Bearer $token"
        },
        body: {
          "email": email,
          "password": password,
          "first_name":name,
          "last_name":"mohamed",
          "age":age,
          "gender":"male",


        });

    dynamic convertedJson = jsonDecode(regesterResopnse.body);
    print(regesterResopnse.body);

    if (regesterResopnse.statusCode == 200) {
      SignupResponse userData = SignupResponse.fromJson(convertedJson);
      print(" Welcome ${userData.data}");
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Verification()));
    } else {
      print(convertedJson["message"]);
    }


    setState(() {
      isLoading = false;
    });

  }
}
