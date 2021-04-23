import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokokita/models/login_response.dart';
import 'package:tokokita/service/app_service.dart';
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
  bool isLoad = false;
  void togglePasswordVisibility() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  validasi() async {
    prefs = await SharedPreferences.getInstance();
    if (formKey.currentState.validate()) {
      setState(() {
        isLoad = true;
      });
      LoginResponse loginResponse = await AuthService.login(
          email: emailCtrl.text, password: passCtrl.text);
      prefs.setBool('is_login', true);
      AppService().prefs.setString('token', loginResponse.accessToken);
      prefs.setString('nama', loginResponse.userData.name);
      prefs.setString('hp', loginResponse.userData.mobilePhone);
      prefs.setString('email', loginResponse.userData.email);
      AppService().dio.options.headers = {
        'Authorization': 'Bearer ${loginResponse.accessToken}'
      };

      print(loginResponse.accessToken);

      print(loginResponse.message);
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {}
  }
}
