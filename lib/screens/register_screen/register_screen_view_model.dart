import 'package:flutter/material.dart';
import 'package:tokokita/models/register_response.dart';
import 'package:tokokita/service/auth_service.dart';
import './register_screen.dart';

abstract class RegisterScreenViewModel extends State<RegisterScreen> {
  // Add your state and logic here

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController nametrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoad = false;

  bool isHidePassword = true;
  void togglePasswordVisibility() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  validasi() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoad = true;
      });

      RegisterResponse registerResponse = await AuthService.register(
          name: nametrl.text,
          mobilePhone: phoneCtrl.text,
          email: emailCtrl.text,
          password: passCtrl.text);
      setState(() {
        isLoad = false;
      });
      if (registerResponse.status == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 6),
            content: const Text('Register success, please come back to login'),
            backgroundColor: Colors.green,
          ),
        );
        nametrl.clear();
        phoneCtrl.clear();
        emailCtrl.clear();
        passCtrl.clear();
      }
    } else {}
  }
}
