// PÁGINA FEITO POR ISABELA MANZANO

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/login.dart';
import 'package:vaidarcerto/shared/style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showPassword2 = false;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Tenta criar o usuário com e-mail e senha
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Tenta atualizar o nome do usuário
        await userCredential.user?.updateDisplayName(_usernameController.text.trim());
        await userCredential.user!.reload();
        _auth.currentUser; // Recarrega o usuário atualizado

        // Exibe uma notificação de sucesso e redireciona
        _showSnackBar('Cadastro realizado com sucesso!', Colors.green);
        Navigator.pop(context); // Volta para a tela de login após o cadastro
      } catch (e) {
        // Exibe uma notificação de erro específico
        _showSnackBar('Erro no cadastro: ${e.toString()}', Colors.red);
      }
    }
  }

  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2),
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
              height: 500,
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
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Informe seu Nome",
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
                    validator: (String? name) {
                    if (name == "" || name == null) {
                      return "Este campo não pode estar vazio";
                    }
                    return null;
                  },
                ),
                  SizedBox(height: 20),
                  TextFormField(
                    autofocus: true,
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Informe seu E-mail",
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
                      labelText: "Informe sua Senha",
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
                  TextFormField(
                    obscureText: _showPassword == false ? true : false,
                    autofocus: true,
                    controller: _confirmPasswordController,
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
                      labelText: "Confirme sua Senha",
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
                      onPressed: _register, 
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                      child: Center( 
                        child: const Text(
                          "Já tem uma conta? Faça Login",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                          textAlign: TextAlign.center, 
                        ),
                      ),
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
    if (_formKey.currentState!.validate()) {
      // Navega para a tela Home usando pushReplacement
    } else {
      print("Erro na validação do formulário");
    }
  }
}
