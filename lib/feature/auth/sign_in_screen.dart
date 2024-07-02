import 'package:flutter/material.dart';
import 'package:task/feature/product/product_list_screen.dart';
import 'package:task/styles/colors.dart';

import '../../styles/text_styles.dart';
import '../widget/common_button.dart';
import '../widget/text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String passErrorMessage = "";

  bool validatePassword(String value) {
    if (!(value.isNotEmpty)) {
      setState(() {
        passErrorMessage = "Password can't be empty";
      });
      return false;
    } else {
      setState(() {
        passErrorMessage = "";
      });
      return true;
    }
  }

  String emailErrorMessage = "";

  bool validateEmail(String value) {
    if (!(value.isNotEmpty)) {
      setState(() {
        emailErrorMessage = "Email can't be empty";
      });
      return false;
    } else {
      setState(() {
        emailErrorMessage = "";
      });
      return true;
    }
  }

  void onLogin() async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProductListScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backGroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 70),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Column(
                    children: [
                      textFiled(setState, 'Email Address',emailController,emailErrorMessage),
                      const SizedBox(height: 5),
                      buildTextField("Password"),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Forgot password ?',
                              style: forgotPasswordTextStyle
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      commonButton(context, 'Login',onLogin),
                      const SizedBox(height: 40),
                      RichText(
                          text: TextSpan(
                              text: 'Don' 't have an account? ',
                              style: forgotPasswordTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Sign Up',
                                  style: signUpOptionTextStyle,
                                )
                              ])),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      controller: passwordController,
      style: textFieldInputStyle,
      cursorColor: hintColor,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 15,bottom: 2,top: 2),
        fillColor: whiteColor,
        filled: true,
        isDense: true,
        hintText: hintText,
        errorText: passwordController.text == '' ? passErrorMessage : '',
        hintStyle: hintTextStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: whiteColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: whiteColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: whiteColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: whiteColor),
        ),
        suffixIcon: hintText == "Password" ? IconButton(
          onPressed: _toggleVisibility,
          icon: _isHidden ? const Icon(Icons.visibility_off,color: hintColor) : const Icon(Icons.visibility,color: hintColor),
        ) : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }
}
