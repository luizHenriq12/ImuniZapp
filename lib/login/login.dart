import 'package:flutter/material.dart';
import 'package:imune_zapp/home/index.dart';
import 'package:imune_zapp/login/register_screen.dart';
import 'forgot_password_screen.dart';

void main() {
  runApp(ImuneZappApp());
}

class ImuneZappApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'imuneZapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF11B39),
        hintColor: Color(0xFF089488),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png", height: 120,),
                SizedBox(height: 20),
                TextField(
                  controller: cpfController,
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Simular uma lógica simples de login
                    String cpf = cpfController.text.trim();
                    String password = passwordController.text.trim();

                    // Verifica se os campos estão preenchidos
                    if (cpf.isEmpty || password.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Erro de login'),
                          content: Text('Por favor, preencha todos os campos.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                      return;
                    }

                    // Aqui você pode implementar a lógica real de autenticação
                    // Por enquanto, vamos simular um login bem-sucedido
                    bool loginSuccess = true;

                    if (loginSuccess) {
                      // Navegar para a tela de home
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      // Mostrar mensagem de erro
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Erro de login'),
                          content: Text('CPF ou senha incorretos.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF01E1DA), // Cor do botão
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text('Esqueceu a senha?'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text('Não tem conta? Cadastre-se'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
