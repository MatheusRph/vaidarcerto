// PÁGINA LIGADA A HOME - ISABELA MANZANO, COM COLABORAÇÃO DE GABRIEL OLIVEIRA E AUXILIO DE THIAGO

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/pesquisa.dart';
import 'package:vaidarcerto/pages/historico.dart';
import 'package:vaidarcerto/pages/voce.dart';


void main() {
  runApp(Principal());
}


class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: PrincipalScreen(),
    );
  }
}


class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}


class _PrincipalScreenState extends State<PrincipalScreen> {
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
    CanalScreen(),
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
    appBar: AppBar(
      title: Text('Título do App'),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
    ),
    // drawer: Drawer(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: <Widget>[
    //       const Spacer(),
    //       ListTile(
    //         leading: Icon(Icons.person),
    //         title: const Text('Conta'),
    //         onTap: () {
    //           Navigator.pop(context);
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => Conta()),
    //           );
    //         },
    //       ),
    //       ListTile(
    //         leading: const Icon(Icons.video_library),
    //         title: const Text('Categorias'),
    //         onTap: () {
    //           Navigator.pop(context);
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => Categorias()),
    //           );
    //         },
    //       ),
    //       ListTile(
    //         leading: const Icon(Icons.settings),
    //         title: const Text('Configurações'),
    //         onTap: () {
    //           Navigator.pop(context);
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => Configuracoes()),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // ),
    body: pages[currentPageIndex], // Verifique se pages não é vazio
  );
}
}

// CARD ESTILO YOUTUBE
class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key});

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
                // Adicione função para abrir o URL
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
