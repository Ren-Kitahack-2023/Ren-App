import 'package:flutter/material.dart';
import 'package:ren/pages/login_page.dart';
import 'package:ren/pages/registration_page.dart';

class LoginOrRegistrationPage extends StatefulWidget {
  const LoginOrRegistrationPage({super.key});

  @override
  State<LoginOrRegistrationPage> createState() => _LoginOrRegistrationPageState();
}

class _LoginOrRegistrationPageState extends State<LoginOrRegistrationPage> {

  // initially display the login page
  bool isLoginPage = true;

  // switch between the login and register pages
  void switchPages() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }



  @override
  Widget build(BuildContext context) {
    
    if (isLoginPage) {
      return LoginPage(onTap: switchPages);
    } else {
      return RegistrationPage(onTap: switchPages);
    }
    
  }
}

