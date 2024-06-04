import 'package:av3/modules/authentication/login.page.dart';
import 'package:flutter/material.dart';

abstract class RoutersApp{
  static const String LOGIN ="/";
  static const String AUTH = "/auth";
  static const String HOME = "/home";

static Map<String, WidgetBuilder> routers ={
  RoutersApp.LOGIN:(context)        => LoginPage(),
  RoutersApp.AUTH:(context)         => Placeholder(),
  RoutersApp.HOME:(context)         => Placeholder(),
};

}