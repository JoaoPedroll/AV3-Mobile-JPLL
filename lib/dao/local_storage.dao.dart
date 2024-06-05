import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class LocalStorage {
  String email = "email";
  String senha = "senha";
  String nome = "nome";

 static emailValido(String email){
  if(email.contains("@")){
    return true;
  }
  return false;
 }

static senhaValida(String senha){
  if(senha.length>=8){
    return true;
  }
  return false;
}





}