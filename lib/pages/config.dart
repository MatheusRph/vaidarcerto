import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Configurações',
      home: Configuracoes(),
    );
  }
}

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
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
        title: const Text(
          'Configurações',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0, // Remover a linha (sombra) do AppBar
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            ListTile(
              title: const Text(
                'Preferências',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18), // Aumenta o tamanho da fonte do título
              ),
              subtitle: const Text(
                'Aparência',
                style: TextStyle(
                    color: Color.fromARGB(186, 158, 158, 158),
                    fontSize: 16), // Aumenta o tamanho da fonte do subtítulo
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Your onTap logic here
              },
            ),
            const Divider(
                color: Color.fromARGB(122, 117, 117,
                    117)), // Linha de separação abaixo do subtítulo
            ListTile(
              title: const Text(
                'Notificações',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18), // Aumenta o tamanho da fonte do título
              ),
              subtitle: const Text(
                'Gerenciar',
                style: TextStyle(
                    color: Color.fromARGB(186, 158, 158, 158),
                    fontSize: 16), // Aumenta o tamanho da fonte do subtítulo
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Your onTap logic here
              },
            ),
            const Divider(
                color: Color.fromARGB(122, 117, 117,
                    117)), // Linha de separação abaixo do subtítulo
            ListTile(
              title: const Text(
                'Segurança e Privacidade',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18), // Aumenta o tamanho da fonte do título
              ),
              subtitle: const Text(
                'Senha, Usuários bloqueados, stories',
                style: TextStyle(
                    color: Color.fromARGB(186, 158, 158, 158),
                    fontSize: 16), // Aumenta o tamanho da fonte do subtítulo
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/security');
              },
            ),
            const Divider(
                color: Color.fromARGB(122, 117, 117,
                    117)), // Linha de separação abaixo do subtítulo
          ],
        ),
      ),
    );
  }
}
