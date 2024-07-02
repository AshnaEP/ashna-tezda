import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../widget/common_button.dart';
import '../widget/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

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

  bool validateName(String value) {
    if (!(value.isNotEmpty)) {
      setState(() {
        nameErrorMessage = "Please enter a name";
      });
      return false;
    } else {
      setState(() {
        nameErrorMessage = "";
      });
      return true;
    }
  }

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

  String errorMessage = "";
  bool validateConfirmPassword(String value) {
    if (!(value.isNotEmpty)) {
      setState(() {
        errorMessage = "This field can't be empty";
      });
      return false;
    } else {
      setState(() {
        errorMessage = "";
      });
      return true;
    }
  }
  String nameErrorMessage = "";

  String phoneErrorMessage = "";
  bool validatePhoneNumber(String value) {
    if (!(value.isNotEmpty)) {
      setState(() {
        phoneErrorMessage = "Enter your phone number";
      });
      return false;
    } else {
      setState(() {
        phoneErrorMessage = "";
      });
      return true;
    }
  }

  bool _isHiddenPassword = true;
  bool _isHiddenCofirmPassword = true;
  void _toggleVisibility() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }
  void _toggleView() {
    setState(() {
      _isHiddenCofirmPassword = !_isHiddenCofirmPassword;
    });
  }

  void onSignUp() async{
    final isValidEmail = validateEmail(emailController.text);
    final isValidName = validateName(nameController.text);
    final isValidPassword = validatePassword(passwordController.text);
    final isValidConfirmPassword = validateConfirmPassword(confirmPasswordController.text);
    final isValidPhoneNumber = validatePhoneNumber(nameController.text);
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
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Column(
                    children: [
                      textFiled(setState, 'Email Address',emailController,emailErrorMessage),
                      const SizedBox(height: 5),
                      buildPasswordField("Password"),
                      const SizedBox(height: 5),
                      buildConfirmPasswordField("Confirm Password"),
                      const SizedBox(height: 25),
                      commonButton(context, 'Sign Up',onSignUp),
                      const SizedBox(height: 40),
                      RichText(
                          text: TextSpan(
                              text: 'Already have an account? ',
                              style: forgotPasswordTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Sign In',
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

  Widget buildPasswordField(String _hintText) {
    return TextField(
      controller: passwordController,
      style: textFieldInputStyle,
      cursorColor: hintColor,
      onChanged: (_) => setState((){}),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 15,bottom: 2,top: 2),
        fillColor: whiteColor,
        filled: true,
        isDense: true,
        hintText: _hintText,
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
        suffixIcon: _hintText == "Password" ? IconButton(
          onPressed: _toggleVisibility,
          icon: _isHiddenPassword ? const Icon(Icons.visibility_off,color: hintColor) : const Icon(Icons.visibility,color: hintColor),
        ) : null,
      ),
      obscureText: _hintText == "Password" ? _isHiddenPassword : false,
    );
  }

  Widget buildConfirmPasswordField(String _hintText) {
    return TextField(
      controller: confirmPasswordController,
      style: textFieldInputStyle,
      cursorColor: hintColor,
      onChanged: (_) => setState((){}),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 15,bottom: 2,top: 2),
        fillColor: whiteColor,
        filled: true,
        isDense: true,
        hintText: _hintText,
        errorText: confirmPasswordController.text == '' ? errorMessage : '',
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
        suffixIcon: _hintText == "Confirm Password" ? IconButton(
          onPressed: _toggleView,
          icon: _isHiddenCofirmPassword ? const Icon(Icons.visibility_off,color: hintColor) : const Icon(Icons.visibility,color: hintColor),
        ) : null,
      ),
      obscureText: _hintText == "Confirm Password" ? _isHiddenCofirmPassword : false,
    );
  }
}
