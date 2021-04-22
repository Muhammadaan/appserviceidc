import 'package:flutter/material.dart';
import 'package:tokokita/utils/style.dart';
import './login_screen_view_model.dart';

class LoginScreenView extends LoginScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Image.asset(logoImg),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email Required';
                    } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value) ==
                        false) {
                      return 'Email Not Valid';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: isHidePassword,
                  controller: passCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Password',
                      // isDense: true,

                      suffixIcon: InkWell(
                        onTap: () {
                          togglePasswordVisibility();
                        },
                        child: Icon(
                          isHidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Pasword Required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    validasi();
                  },
                  child: Text("Login"),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: mainColor,
                      onSurface: Colors.grey,
                      minimumSize: Size(double.infinity, 50)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account ?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text("Sign Up")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
