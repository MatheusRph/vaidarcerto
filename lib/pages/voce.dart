// PÁGINA FEITA POR MATHEUS RODOLPHO

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/login.dart';

class CanalScreen extends StatefulWidget {
  const CanalScreen({super.key});

  @override
  _CanalScreenState createState() => _CanalScreenState();
}
class _CanalScreenState extends State<CanalScreen> {
  int _selectedTab = 0;
  User? _user;

  @override
  void initState() {
    super.initState();
    // Obter usuário atual (verificar se está autenticado)
    _user = FirebaseAuth.instance.currentUser;
  }

  // Função para sair (logout)
  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: _logout,  // Função de logout
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
          width: 300.0,
          height: 600.0,
          color: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Exibindo as informações do usuário
              _user != null
                  ? Column(
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _user?.displayName ?? 'User',
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          _user?.email ?? 'user@example.com',
                          style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 138, 138, 138)),
                        ),
                        const SizedBox(height: 20),
                      ],
                    )
                  : const CircularProgressIndicator(), // Exibe carregando enquanto não autenticado

              // Containers de abas
              Container(
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100.0,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TabButton(
                            title: 'Seus vídeos',
                            isSelected: _selectedTab == 0,
                            onTap: () {
                              setState(() {
                                _selectedTab = 0;
                              });
                            },
                          ),
                          TabButton(
                            title: 'Salvos',
                            isSelected: _selectedTab == 1,
                            onTap: () {
                              setState(() {
                                _selectedTab = 1;
                              });
                            },
                          ),
                          TabButton(
                            title: 'Curtidos',
                            isSelected: _selectedTab == 2,
                            onTap: () {
                              setState(() {
                                _selectedTab = 2;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    _getSelectedTabWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSelectedTabWidget() {
    switch (_selectedTab) {
      case 0:
        return const Center(child: Text('Your Videos Content', style: TextStyle(color: Colors.white)));
      case 1:
        return const Center(child: Text('Saved Videos Content', style: TextStyle(color: Colors.white)));
      case 2:
        return const Center(child: Text('Liked Videos Content', style: TextStyle(color: Colors.white)));
      default:
        return const SizedBox.shrink();
    }
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        alignment: Alignment.center,
        color: Colors.black,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}