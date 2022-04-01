import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter_firebase/auth/auth_controller.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List images = ["g.png", "t.png", "f.png"];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/img/signup.png"),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.153,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 47,
                  backgroundImage: AssetImage('assets/img/profile1.png'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(),
              //     ),
              //     Text(
              //       'Forgot your Password?',
              //       style: TextStyle(
              //         fontSize: 20,
              //         color: Colors.grey[500],
              //       ),
              //     ),
              //   ],
              // ),
            ]),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                AuthController.instance
                    .register(emailController.text, passwordController.text);
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage("assets/img/loginbtn.png"),
                      fit: BoxFit.cover,
                    )),
                child: const Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: 'Have an account',
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]))),
          SizedBox(height: h * 0.06),
          RichText(
              text: const TextSpan(
            text: "Sign up using one of the following methods",
            style: TextStyle(
              color: Color.fromRGBO(158, 158, 158, 1),
              fontSize: 13,
            ),
          )),
          Wrap(
            children: List<Widget>.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[500],
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/img/" + images[index]),
                  ),
                ),
              );
            }),
          )
        ]),
      ),
    );
  }
}
