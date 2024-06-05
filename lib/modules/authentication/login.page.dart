import 'package:av3/dao/local_storage.dao.dart';
import 'package:av3/modules/authentication/authentication.controller.dart';
import 'package:av3/modules/authentication/create_account.page.dart';
import 'package:av3/modules/home/home.page.dart';
import 'package:av3/modules/routers/routers.scheme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();


  booleano() async {
      bool resultado = await AuthController.entrar(_emailController.text, _senhaController.text);
      return resultado;
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          width: largura,
          height: altura,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => const RadialGradient(
                    center: Alignment.center,
                    radius: 0.3,
                    colors: [
                      Colors.green,
                      Colors.purple,
                      Colors.orange,
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds),
                  child: const Icon(
                    Icons.person_2,
                    size: 100,
                  ),
                ),
                //
                const SizedBox(
                  height: 36,
                ),
                //
                 TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("E-mail"),
                    hintText: "Digite seu e-mail",
                  ),
                ),
                //
                const SizedBox(
                  height: 36,
                ),
                //
                 TextField(
                  controller: _senhaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Senha"),
                    hintText: "Digite sua senha",
                  ),
                ),
                //
                const SizedBox(
                  height: 36,
                ),
                //
                ElevatedButton(
                  onPressed: ()async{
                    if(await booleano()==true){
                    Navigator.pushReplacementNamed(context, RoutersApp.HOME);
                    }else{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.amber,
                              title: Text("Erro"),
                              content: Text(
                                "Credenciais inválido",
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          });
                    }
                     


                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(
                        largura,
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.blueAccent,
                    ),
                  ),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                //
                const SizedBox(
                  height: 24,
                ),
                //
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(
                        largura,
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.deepOrange,
                    ),
                  ),
                  child: const Text(
                    "Criar Conta",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
