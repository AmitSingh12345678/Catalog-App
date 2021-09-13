import 'package:first_app/utils/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool isLoginPressed = false;

  final _form_key = GlobalKey<FormState>();

  void goToHome() async {
    FormState? currentState = _form_key.currentState;
    if (currentState != null && currentState.validate()) {
      setState(() {
        isLoginPressed = true;
      });
      await Future.delayed(Duration(milliseconds: 500));
      await Navigator.pushNamed(context, AppRoutes.homeRoute);
      setState(() {
        isLoginPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _form_key,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/login_image.png",
                  fit: BoxFit.cover,
                  height: 250,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Username can't be empty.";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter username", labelText: "Username"),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Password can't be empty.";
                            } else if (value != null && value.length < 6) {
                              return "Password length should be at least 6.";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter password",
                              labelText: "Password")),
                      SizedBox(
                        height: 40,
                      ),
                      Material(
                        color: Colors.purple,
                        borderRadius:
                            BorderRadius.circular(isLoginPressed ? 50 : 8),
                        child: InkWell(
                          onTap: () async {
                            goToHome();
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            height: 50,
                            width: isLoginPressed ? 50 : 150,
                            alignment: Alignment.center,
                            child: isLoginPressed
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
