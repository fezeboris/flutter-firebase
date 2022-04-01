import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/auth_controller.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/img/loginimg.png"),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Hello',
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
              ),
              Text(
                'Sign into your account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "enter Your email",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.deepOrangeAccent,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "enter Your password",
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.deepOrangeAccent,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    'Forgot your Password?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                AuthController.instance
                    .login(emailController.text, passwordController.text);
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage("assets/img/loginbtn.png"),
                      fit: BoxFit.cover,
                    )),
                child: const Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.04),
          RichText(
              text: TextSpan(
                  text: "Don't have an account ?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                  ),
                  children: [
                TextSpan(
                  text: " Create",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(() => SignUp()),
                )
              ]))
        ]),
      ),
    );
  }
}
