import 'package:flutter/material.dart';
import 'package:tokokita/utils/style.dart';
import './register_screen_view_model.dart';

class RegisterScreenView extends RegisterScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(logoImg),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: nametrl,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name Required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
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
                  controller: phoneCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Phone',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Phone Required';
                    } else if (value.length < 10) {
                      return "Phone Min 10 Digits";
                    } else if (value.length > 13) {
                      return "Phone Max 13 Digist";
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
                  child: Text("Register"),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: mainColor,
                      onSurface: Colors.grey,
                      minimumSize: Size(double.infinity, 50)),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
