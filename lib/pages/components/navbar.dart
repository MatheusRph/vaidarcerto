// PÁGINA FEITO POR ISABELA MANZANO, COM COLABORAÇÃO DE GABRIEL OLIVEIRA E MATHEUS RODOLPHO

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const NavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onItemSelected,
      indicatorColor: Colors.blue,
      selectedIndex: currentIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home, color: Colors.white),
          label: 'Home',      
        ),
        NavigationDestination(
          icon: Icon(Icons.search, color: Colors.white),
          label: 'Pesquisa',
        ),
        NavigationDestination(
          icon: Icon(Icons.history, color: Colors.white),
          label: 'Histórico',
        ),
        NavigationDestination(
          icon: Icon(Icons.person, color: Colors.white),
          label: 'Você',
        ),
      ],
    );
  }
}
