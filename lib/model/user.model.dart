import 'package:av3/dao/local_storage.dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userModel {
  String? nome;
  String? email;
  
 Future<String> getUserData(String dado) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(dado=="email"){
    String data = prefs.getString(LocalStorage().email)!;
    return data;
    }else if(dado=="senha"){
    String data = prefs.getString(LocalStorage().senha)!;
    return data;
    }else return "erro";
  }
}