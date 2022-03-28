
import 'package:flutter/material.dart';
import 'package:valyute/screens/main_page.dart';


class MyRoute{
  Route? onGenerateRoute(RouteSettings settings){
    var arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=> MainPage());
    }
  }
}