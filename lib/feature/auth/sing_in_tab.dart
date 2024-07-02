import 'package:flutter/material.dart';
import 'package:task/feature/auth/sign_in_screen.dart';
import 'package:task/feature/auth/sign_up_screen.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';


class SignInTab extends StatefulWidget {
  const SignInTab({Key? key}) : super(key: key);

  @override
  State<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Sign In'),
    Tab(text: 'Sign Up'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(280.0),
              child: AppBar(
              bottom: TabBar(
                  tabs: myTabs,
                  indicatorColor: greenTextColor,
                  indicatorWeight: 3.0,
                  labelColor: greenTextColor,
                  unselectedLabelColor: hintColor,
                  labelStyle: signUpTextStyle,
                ),
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),

                  child: Stack(
                    children: [
                      Image.asset('assets/images/login_card_image.png'),
                      Padding(
                        padding: const EdgeInsets.only(top: 90,bottom: 100),
                        child: Center(child: Image.asset('assets/images/tezda_logo.png',height: 112,width: 122)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: const TabBarView(
            children: [
               SignInScreen(),
               SignUpScreen(),
            ],
            ),
          ),
        ),
    );
  }
}
