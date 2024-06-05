import 'package:av3/model/user.model.dart';
import 'package:av3/modules/authentication/login.page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Saudações"),
          centerTitle: true,
          leading: const Icon(
            Icons.home,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: largura,
          height: altura,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //
              FutureBuilder<String>(
        future: userModel().getUserData('email'),
        builder: (context, snapshot){
          return Text("${snapshot.data}",style: TextStyle(color: Colors.black87),);},),
              //
              FutureBuilder<String>(
        future: userModel().getUserData('senha'),
        builder: (context, snapshot){
          return Text("${snapshot.data}",style: TextStyle(color: Colors.black87),);},),
              //
              //
              //
            ],
          ),
        ),
      ),
    );
  }
}
