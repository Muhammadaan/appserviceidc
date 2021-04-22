import 'package:flutter/material.dart';
import './register_screen.dart';

abstract class RegisterScreenViewModel extends State<RegisterScreen> {
  // Add your state and logic here

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController nametrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
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
