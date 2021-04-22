import 'package:flutter/material.dart';
import './login_screen.dart';

abstract class LoginScreenViewModel extends State<LoginScreen> {
  // Add your state and logic here

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isHidePassword = true;
  void togglePasswordVisibility() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  validasi() async {
    if (formKey.currentState.validate()) {
    } else {}
  }
}
