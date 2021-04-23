import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokokita/models/login_response.dart';
import 'package:tokokita/service/auth_service.dart';
import './login_screen.dart';

abstract class LoginScreenViewModel extends State<LoginScreen> {
  // Add your state and logic here

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  LoginResponse loginResponse;
  final formKey = GlobalKey<FormState>();
  Response response;
  var dio = Dio();
  SharedPreferences prefs;
  bool isHidePassword = true;
  void togglePasswordVisibility() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  validasi() async {
    prefs = await SharedPreferences.getInstance();
    if (formKey.currentState.validate()) {
      LoginResponse loginResponse = await AuthService.login(
          email: emailCtrl.text, password: passCtrl.text);

      print(loginResponse.message);
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {}
  }
}
