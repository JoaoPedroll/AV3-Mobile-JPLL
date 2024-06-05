import 'package:av3/dao/local_storage.dao.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  //criar
  static createAccount(String nome, String email, String senha) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(LocalStorage().nome, nome);
    prefs.setString(LocalStorage().email, email);
    prefs.setString(LocalStorage().senha, senha);
  }

  static verificarEmail(String emailInformado) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (emailInformado == prefs.getString(LocalStorage().email)) {
      return true;
    }
    return false;
  }

  static verificarSenha(String senhaInformada) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (senhaInformada == prefs.getString(LocalStorage().senha)) {
      return true;
    }else{
return false;
    }
    
  }

  static entrar(String email, String senha)async {
    if (await verificarEmail(email) && verificarSenha(senha) == true) {
      
return true;
    }else{
    return false;
    }
    
  }

}
