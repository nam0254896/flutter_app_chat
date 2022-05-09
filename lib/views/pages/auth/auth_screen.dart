import 'package:flutterappclone/views/pages/auth/login_screen.dart';
import 'package:flutterappclone/views/pages/auth/register_screen.dart';
import 'package:flutterappclone/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_text.dart';
import '../../widgets/colors.dart';
import '../../widgets/text.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, body: Column(
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
                    'assets/images/sakura.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1 / 2,
                      width: MediaQuery.of(context).size.width - 16,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: 'Chat App',
                            fontsize: 50,
                            color: MyColors.yellowColor,
                            alignment: Alignment.center,
                            fontFamily: 'SquarePeg',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            text: 'LOGIN',
                            color: MyColors.mainColor,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                              );
                            },
                            text: 'SIGN UP',
                            color: MyColors.secondColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 16,
                            alignment: Alignment.centerRight,
                            child: ButtonTextCustom(
                              onPress: () {},
                              text: 'Forgot Password ?',
                              fontsize: 20,
                              color: MyColors.yellowColor,
                              alignment: Alignment.centerRight,
                              fontFamily: 'DancingScript',
                            ),
                          ),
                        ],
                      ),
                    ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
