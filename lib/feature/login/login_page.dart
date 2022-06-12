import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teleheal_mzulfaas/base.dart';
import 'package:teleheal_mzulfaas/feature/dashboard/dashboard_page.dart';
import 'package:teleheal_mzulfaas/feature/dashboard/main_dashboard_page.dart';
import 'package:teleheal_mzulfaas/feature/login/login_presenter.dart';
import 'package:teleheal_mzulfaas/feature/register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final loginPresenter = Get.put(LoginPresenter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text("Login", style: TextStyle(color: Colors.black),),

      ),
      body: Center(
        child: Form(
          key: loginPresenter.formKey,
          child: ListView(
            // key: _formKey,
            shrinkWrap: true,
            // padding: EdgeInsets.only(left: 24.0, right: 24.0),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return loginPresenter.validateEmail(value);
                  },
                  controller: loginPresenter.emailController,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password!!';
                    }
                    return null;
                  },
                  controller: loginPresenter.passController,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  obscureText: loginPresenter.obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        loginPresenter.obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          loginPresenter.obscureText = !loginPresenter.obscureText;
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
                  Get.to(RegisterPage());
                },
                  child: Center(child: Text("Don't have an account?\nRegister",style: TextStyle(color: Colors.black54),textAlign: TextAlign.center,))),

              SizedBox(
                height: 10,
              ),
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                  ),
                  child: Text(
                    "Login"
                  ),
                  onPressed: (){
                    if(loginPresenter.formKey.currentState!.validate()){
                      Base().showLoaderDialog(context);
                      Future.delayed(Duration(seconds: 4),(){
                        Get.offAll(MainDashboardPage());
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
