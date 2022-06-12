import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teleheal_mzulfaas/feature/register/register_presenter.dart';

import '../dashboard/dashboard_page.dart';
import '../dashboard/main_dashboard_page.dart';
import '../login/login_page.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final registerPresenter = Get.put(RegisterPresenter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text("Register", style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Center(
              child: Form(
                key: registerPresenter.formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/images/splash.png'),
                    ),
                    Center(
                      child: Text(
                        "Demo Version",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    // SizedBox(height: 20,),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                      child: TextFormField(
                        validator: (value) {
                          return registerPresenter.validateEmail(value);
                        },
                        controller: registerPresenter.emailController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        validator: (value) {
                          if (!(value!.length > 10) && value.isNotEmpty) {
                            return "Phone number less than 10 digits!!";
                          }
                          if (value == null || value.isEmpty) {
                            return 'Please enter Phone number!!';
                          }
                          return null;
                        },
                        controller: registerPresenter.phoneController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Phone',
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password!!';
                          }
                          return null;
                        },
                        controller: registerPresenter.passController,
                        textAlign: TextAlign.center,
                        autofocus: false,
                        obscureText: registerPresenter.obscureText,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              registerPresenter.obscureText ? Icons.visibility_off : Icons.visibility,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                registerPresenter.obscureText = !registerPresenter.obscureText;
                              });
                            },
                          ),
                          hintText: 'Password',
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(65.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    InkWell(
                        onTap: (){
                          Get.to(LoginPage());
                        },
                        child: Center(child: Text("Have an account?\nLogin",style: TextStyle(color: Colors.black54),textAlign: TextAlign.center,))),

                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: Text(
                            "Register"
                        ),
                        onPressed: (){
                          if(registerPresenter.formKey.currentState!.validate()){
                            Get.to(MainDashboardPage());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
