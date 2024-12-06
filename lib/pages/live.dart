import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Live extends StatefulWidget {
  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> {
  late YoutubePlayerController _controller;
  bool isFollowing = false;
  String? selectedIcon; // null, 'like', or 'unlike'
  
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = []; // Lista que salva as mensagens do chat

  void toggleIcon(String iconType) {
    setState(() {
      selectedIcon = selectedIcon == iconType ? null : iconType; // Alterna a seleção do ícone
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
      initialVideoId: 'Qoe-zNMTgF0', // Substitua com o ID do vídeo desejado
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
      body: Stack(
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
                        'CASIMIRO E OLIVINHA DÃO AULA NO FIFA!', // Título da live
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
                          backgroundImage: AssetImage('assets/images/Eigames.jpg'),
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
                              isFollowing = !isFollowing; // Alterna entre seguir e não seguir
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
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
                            color: selectedIcon == 'like' ? Colors.blue : Colors.white,
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
                            color: selectedIcon == 'unlike' ? Colors.blue : Colors.white,
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
                              height: 300,
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Digite sua mensagem...",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: _sendMessage,
                      icon: const Icon(Icons.send, color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}