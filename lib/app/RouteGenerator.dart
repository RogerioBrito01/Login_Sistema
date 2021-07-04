import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc/app/views/home/home.dart';
import 'package:tcc/app/views/login/login_page/login_page.dart';
import 'package:tcc/app/views/splash_page/splash_page.dart';
import 'package:tcc/app/views/login/cadastro_page/cadastro_page.dart';
import 'package:tcc/app/views/login/reset_password/reset-password.dart';
import 'package:tcc/app/views/login/termo_page/termo_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      //Login
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => Home());
      case "/cadastro":
        return MaterialPageRoute(builder: (_) => Cadastro());
      case "/termo":
        return MaterialPageRoute(builder: (_) => Termo());
      case "/login":
        return MaterialPageRoute(builder: (_) => Login());
      case "/reset-password":
        return MaterialPageRoute(builder: (_) => ResetPasswordPage());

      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada!"),
        ),
        body: Center(
          child: Text("Tela não encontrada!"),
        ),
      );
    });
  }
}
