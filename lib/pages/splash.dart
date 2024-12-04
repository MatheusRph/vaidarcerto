// PÁGINA FEITO POR ISABELA MANZANO, COM COLABORAÇÃO DE MATHEUS RODOLPHO

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/login.dart';
import 'package:vaidarcerto/shared/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoController; // Controlador da animação da logo.
  late AnimationController _loadingController; // Controlador da animação de carregamento.
  late Animation<Offset> _slideAnimation; // Animação de deslizamento.
  bool _showLoadingIcon = false; // Controla a exibição do ícone de carregamento.

  @override
  void initState() {
    super.initState();

    // Inicializa o controlador da animação da logo.
    _logoController = AnimationController(
      duration: const Duration(seconds: 2), // Duração da animação da logo
      vsync: this,
    );

    // Inicializa o controlador da animação de carregamento.
    _loadingController = AnimationController(
      duration: const Duration(seconds: 3), // Duração da rotação
      vsync: this,
    );

    // Define a animação de deslizamento.
    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0), // Começa fora da tela (abaixo).
      end: Offset(0.0, 0.0),   // Termina na posição normal (visível).
    ).animate(CurvedAnimation(
      parent: _logoController, // Associa a animação ao controlador da logo.
      curve: Curves.easeInOut, // Define uma curva suave para a animação.
    ));

    // Inicia a animação da logo.
    _animateLogo();
  }

  void _animateLogo() {
    _logoController.forward().then((_) {
      // Após a animação da logo, ativa o ícone de carregamento.
      setState(() {
        _showLoadingIcon = true; // Atualiza o estado para mostrar o ícone de carregamento.
      });

      // Inicia a rotação do ícone de carregamento.
      _startLoadingAnimation();
    });
  }

  void _startLoadingAnimation() {
    _loadingController.repeat(); // Inicia a rotação do ícone de carregamento.

    // Aguarda 3 segundos antes de mudar para a tela de Login.
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _loadingController.stop(); // Para a animação de carregamento.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()), // Navega para a tela de Login.
        );
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose(); // Libera os recursos do controlador da logo.
    _loadingController.dispose(); // Libera os recursos do controlador de carregamento.
    super.dispose(); // Chama o método dispose da superclasse.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.gradient1,
              MyColors.gradient2,
            ],
            stops: [0.0, 0.8], // Posições das cores no degradê
            begin: Alignment.topCenter,
            end: Alignment.bottomRight, // Fim do gradiente.
          ),
        ),
        child: Center( // Centraliza os widgets dentro do container.
          child: SlideTransition( // Aplica a animação de deslizamento.
            position: _slideAnimation, // A animação que controla a posição.
            child: Column( // Alinha os filhos verticalmente.
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente.
              children: [
                Image.asset("assets/logo.png"), // Exibe a logo a partir dos assets.
                const SizedBox(height: 20), // Espaçamento vertical.
                if (_showLoadingIcon) // Mostra o ícone de carregamento somente se _showLoadingIcon for verdadeiro.
                  AnimatedBuilder(
                    animation: _loadingController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _loadingController.value * 2.0 * 3.14159, // Animação de rotação.
                        child: Image.asset(
                          "assets/loading.png",
                          color: Colors.white,
                          width: 80,
                          height: 80,
                          semanticLabel: 'Ícone de carregamento',
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
