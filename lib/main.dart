import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/home.dart';
import 'package:vaidarcerto/pages/login.dart';
import 'package:vaidarcerto/pages/cadastro.dart';
import 'package:vaidarcerto/pages/splash.dart';
import 'package:vaidarcerto/pages/pesquisa.dart';
import 'package:vaidarcerto/pages/historico.dart';
import 'package:vaidarcerto/pages/voce.dart';
import 'package:vaidarcerto/shared/style.dart';
import 'package:vaidarcerto/pages/changpass.dart';
import 'package:vaidarcerto/pages/security.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que a ligação dos widgets do Flutter esteja inicializada antes de usar qualquer plugin
  await Firebase.initializeApp(); // Inicializa o Firebase na aplicação
  runApp(const MyApp()); // Executa a aplicação iniciando pela classe MyApp
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, 
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azulEscuro),
        useMaterial3: true,
      ),
      initialRoute: "/splash",
     routes: {
      '/splash' : (context) => SplashScreen(),
      '/login' : (context) =>  LoginScreen(),
      '/cadastro' : (context) => const CadastroScreen(),
      '/home' : (context) => Home(),
      '/pesquisa': (context) => Pesquisa(),
      '/historico': (context) => Historico(),
      '/voce': (context) => CanalScreen(),
      '/changpass': (context) => ChangPassword(),  // Password change route
      '/security': (context) => SecurityApp(),  // Security settings route
     },
    ); 
  }
}
