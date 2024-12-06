import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late YoutubePlayerController _controller;
  bool isFollowing = false;
  String? selectedIcon; // null, 'like', or 'unlike'

  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = []; // Lista que salva as mensagens do chat

  void toggleIcon(String iconType) {
    setState(() {
      selectedIcon = selectedIcon == iconType
          ? null
          : iconType; // Alterna a seleção do ícone
    });
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text); // Adiciona a mensagem à lista
        _messageController.clear(); // Limpa o campo de texto
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Inicializando o controller do player do YouTube com um vídeo específico
    _controller = YoutubePlayerController(
      initialVideoId: 'WfTL9-CfT1M', // Substitua com o ID do vídeo desejado
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    // Liberar recursos ao fechar o player
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Player de vídeo do YouTube
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          'Video sksjfsaí', // Título da Video
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Informações do canal
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/Eigames.jpg'),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Eigames',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '856 mil inscritos',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isFollowing =
                                    !isFollowing; // Alterna entre seguir e não seguir
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 14),
                            ),
                            child: Text(
                              isFollowing ? 'Seguindo' : 'Seguir',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () => toggleIcon('like'),
                            icon: Icon(
                              Icons.thumb_up,
                              color: selectedIcon == 'like'
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                            iconSize: 20,
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            padding: EdgeInsets.zero,
                            splashRadius: 30,
                          ),
                          IconButton(
                            onPressed: () => toggleIcon('unlike'),
                            icon: Icon(
                              Icons.thumb_down,
                              color: selectedIcon == 'unlike'
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                            iconSize: 20,
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            padding: EdgeInsets.zero,
                            splashRadius: 30,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Comentários', // Título da Video
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16  ,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Seção de chat com borda cinza
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Column(
                            children: [
                              // Exibe as mensagens do chat
                              SizedBox(
                                height: 150,
                                width: 280,
                                child: ListView.builder(
                                  reverse: true,
                                  itemCount: _messages.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.blue[100],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            _messages[index],
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    );
                                    
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Column(
                            children: [
                              // Exibe as mensagens do chat
                              SizedBox(
                                height: 150,
                                width: 280,
                                child: ListView.builder(
                                  reverse: true,
                                  itemCount: _messages.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.blue[100],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            _messages[index],
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    );
                                    
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Column(
                            children: [
                              // Exibe as mensagens do chat
                              SizedBox(
                                height: 150,
                                width: 280,
                                child: ListView.builder(
                                  reverse: true,
                                  itemCount: _messages.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.blue[100],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            _messages[index],
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    );
                                    
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.grey[900], // Fundo da caixa
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black), // Borda da caixa
    ),
    child: Column(
      children: [
        // Adiciona a imagem com bordas arredondadas
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Mesmo raio da caixa
            child: Image.asset(
              './assets/images/card.jpg', // Caminho da imagem
              fit: BoxFit.cover,
              width: 100, // Tamanho ajustado à largura da caixa
              height: 80, // Altura proporcional
            ),
          ),
        ),
        const Divider(
          color: Colors.black, // Linha de separação
          height: 1,
          thickness: 0.5,
        ),
        // Exibe as mensagens do chat
        SizedBox(
          height: 150,
          width: 280,
          child: ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _messages[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  ),
),

                    ],
                  ),
                ),
              ),
            ),
            // Campo de digitação fixo na parte inferior da tela
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            //       decoration: BoxDecoration(
            //         color: Colors.grey[900],
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(color: Colors.black),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
