import 'package:flutter/material.dart';

import 'auth/auth_controller.dart';

class HomePage extends StatelessWidget {
  String email;
  HomePage({Key? key, required this.email}) : super(key: key);

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
          Container(
            width: w,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                AuthController.instance.logout();
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.09,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage("assets/img/loginbtn.png"),
                      fit: BoxFit.cover,
                    )),
                child: const Center(
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
