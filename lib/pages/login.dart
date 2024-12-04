// PÁGINA FEITO POR ISABELA MANZANO, COM COLABORAÇÃO DE GABRIEL OLIVEIRA

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/cadastro.dart';
import 'package:vaidarcerto/pages/home.dart';
import 'package:vaidarcerto/shared/style.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:google_sign_in/google_sign_in.dart';


// Define um widget Stateful para a tela de login
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// Estado associado ao LoginScreen
class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Instância do FirebaseAuth para autenticação
  final TextEditingController _emailController = TextEditingController(); // Controlador para o campo de e-mail
  final TextEditingController _passwordController = TextEditingController(); // Controlador para o campo de senha
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  // Método assíncrono para realizar o login
  Future<void> _login() async {
    try {
      // Tenta fazer login com e-mail e senha fornecidos
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Se o login for bem-sucedido, navega para a tela inicial
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } catch (e) {
      // Em caso de erro, exibe uma notificação com a mensagem de erro
      _showSnackBar('Erro no login: $e', Colors.red);
    }
  }

  //Com o google
  Future<void> _signInWithGoogle() async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      _showSnackBar('Login com Google cancelado.', Colors.red);
      return;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Realiza o login com o Firebase
    await _auth.signInWithCredential(credential);

    
    // Navega para a página inicial após o login bem-sucedido
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  } catch (e) {
    _showSnackBar('Erro no login com Google: $e', Colors.red);
  }
}

  // Método para exibir uma mensagem na parte inferior da tela (SnackBar)
  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2), // Duração de exibição do SnackBar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
     
   
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.gradient1, MyColors.gradient2
            ],
            stops: [0.0, 0.8], 
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Image.asset(
            'assets/logo.png', 
            height: 150, 
            fit: BoxFit.contain, 
          ),
          SizedBox(height: 20), 

          
          Center(
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(106, 255, 255, 255),
                borderRadius: BorderRadius.circular(8.0), 
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      SizedBox(height: 20), 
                   
                  TextFormField(
                    autofocus: true,
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Informe o E-mail",
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), 
                              ),
                              enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), 
                              ),
                              focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), 
                              ),
                   
                    ),
                   validator: (String? email) {
                      if (email == "" || email == null) {
                        return "O email não pode ser vazio";
                      }
                      if (email.length < 6) {
                        return "O email está muito curto";
                      }
                      if (!email.contains("@")) {
                        return "O email é inválido";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: _showPassword == false ? true : false,
                    autofocus: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(child: Icon(
                      color: Colors.white,
                      _showPassword == false ? Icons.visibility_off : Icons.visibility,
                      ),
                     
                      onTap:(){
                        setState(() {
                          _showPassword = !_showPassword;
                        });
            
            
                      }),
                      labelText: "Informe a Senha",
                      labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), 
                              ),
                              enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), 
                              ),
                              focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), 
                              ),
                   
                    ),
                   validator: (String? password) {
                      if (password == "" || password == null) {
                        return "A senha não pode estar vazia";
                      }
                      return null;
                    },
                  ),
                 
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: _login,
                      child: Text("Entrar"),

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                     
                    ),
                    ),
                  ),
                  SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroScreen()));
                          },
                      child: Center( 
                        child: const Text(
                          "Não tem uma conta? Faça Cadastro",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                          textAlign: TextAlign.center, 
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  // Ícone do Google
                  GestureDetector(
                    onTap: () {
                      _signInWithGoogle();
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/google_icon.png'),
                      backgroundColor: Colors.transparent,
                      radius: 20,
                    ),
                  ),
                ],
              ),
              ],
              ),
            ),
            ),
          ),
          ),
        ],
      ),
    ),
    ),  
    ),
    );
  }




  void buttonEnterClick() {
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => Home()));
  }
}

