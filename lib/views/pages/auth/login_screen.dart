import 'package:flutterappclone/database/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../../widgets/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/textformfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  String? validateEmail(String value) {
    if (value == '') {
      return "Empty Field !";
    } else if (!isValidEmail(value)) {
      return "Wrong Email !";
    } else {
      return null;
    }
  }

  doLogin(BuildContext context) {
    bool isValidate = _loginFormKey.currentState!.validate();
    if (isValidate) {
      AuthService.loginFetch(
          context: context,
          email: emailController.text,
          password: passwordController.text);
    }
  }

  String? validatePassword(String value) {
    if (value == '') {
      return "Empty Field !";
    } else if (value.length <= 5) {
      return "Your password is so short !";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        // borderRadius: new BorderRadius.only(
                        //   bottomRight: const Radius.circular(40.0),
                        //   bottomLeft: const Radius.circular(40.0),
                        // ),
                        ),
                    child: Image.asset(
                      'assets/images/peachflowerblossom.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.backspace,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 12,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          // borderRadius: new BorderRadius.only(
                          //   bottomRight: const Radius.circular(40.0),
                          //   bottomLeft: const Radius.circular(40.0),
                          // ),
                          ),
                      child: Image.asset(
                        'assets/images/pinkbird.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          // borderRadius: new BorderRadius.only(
                          //   bottomRight: const Radius.circular(40.0),
                          //   bottomLeft: const Radius.circular(40.0),
                          // ),
                          ),
                      child: Image.asset(
                        'assets/images/pinkwater.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 1 / 2,
                        width: MediaQuery.of(context).size.width - 32,
                        child: Form(
                          key: _loginFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextFormField(
                                  controller: emailController,
                                  text: 'E-mail',
                                  hint: 'nguyennam@gmail.com',
                                  onSave: (value) {
                                    //controller.userName = value!;
                                  },
                                  validator: (value) {
                                    return validateEmail(value!);
                                  }),
                              const SizedBox(height: 20),
                              CustomTextFormField(
                                  controller: passwordController,
                                  passCheck: true,
                                  text: 'Password',
                                  hint: '************',
                                  onSave: (value) {
                                    //controller.userPwd = value!;
                                  },
                                  validator: (value) {
                                    return validatePassword(value!);
                                  }),
                              const SizedBox(height: 20),
                              CustomButton(
                                onPress: () {
                                  doLogin(context);
                                },
                                text: 'LOGIN',
                                color: MyColors.mainColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
