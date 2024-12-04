// PÁGINA FEITO POR ISABELA MANZANO

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/pesquisa.dart';
import 'package:vaidarcerto/pages/historico.dart';
import 'package:vaidarcerto/pages/voce.dart';
import './components/navbar.dart';
import 'package:vaidarcerto/pages/principal.dart';




void main() {
  runApp(Home());
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedValue;
  bool _isDropdownOpened = false;


  void _toggleDropdown() {
    setState(() {
      _isDropdownOpened = !_isDropdownOpened;
    });
  }


  int currentPageIndex = 0;
 
  final List<Widget> pages = [
    const PrincipalPage(),
    Pesquisa(),
    Historico(),
    const CanalScreen(),

  ];


  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: _scaffoldKey,
     


      // Exibe a página atual
      body: pages[currentPageIndex],


      // NavBar Componentizado
      bottomNavigationBar: NavBar(
        currentIndex: currentPageIndex,
        onItemSelected: (index) {
          _onItemTapped(index); // Trata a navegação baseada no índice selecionado
        },
      ),

      

    );
  }
}


// CARD ESTILO YOUTUBE
class HomePage extends StatelessWidget {
  @override
  
  
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        buildYouTubeCard(
          context,
          'TSUNAMI AUTOMÁTICO - Minecraft Em busca da casa automática #308',
          'assets/tsunamiautomatico.jpg',
          'Viniccius13',
          '3,7 mi de visualizações',
          'assets/viniccius13.jpg',
        ),
        buildYouTubeCard(
          context,
          'VALORANT AO VIVO! - O NOVO JOGO DO MOMENTO?',
          'assets/valorantaovivo.jpg',
          'Ei Games',
          '15 mil de visualizações',
          'assets/eigames.jpg',
        ),
        buildYouTubeCard(
          context,
          'MANCHESTER CITY X REAL MADRID TRANSMISSÃO AO VIVO DIRETO DO ETIHAD STADIUM - CHAMPIONS LEAGUE 2023',
          'assets/realmadrid.jpg',
          'Litoral News',
          '1 mi de visualizações',
          'assets/litoralnews.jpg',
        ),
        buildYouTubeCard(
          context,
          'Farm de Madeira 100% Automática - Minecraft Em busca da casa automática #342',
          'assets/farmdemadeira.jpg',
          'Viniccius13',
          '3,8 mi de visualizações',
          'assets/viniccius13.jpg',
        ),
      ],
    );
  }


  // CONTINUAÇÃO CARD ESTILO YOUTUBE
  Widget buildYouTubeCard(
    BuildContext context,
    String title,
    String imageUrl,
    String channelName,
    String videoInfo,
    String avatarImageUrl,
  ) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ink.image(
            image: AssetImage(imageUrl),
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            child: InkWell(
                onTap: () {
},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(avatarImageUrl),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$channelName • $videoInfo',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
