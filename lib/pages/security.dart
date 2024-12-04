import 'package:flutter/material.dart';

class SecurityApp extends StatefulWidget {
  @override
  _SecurityAppState createState() => _SecurityAppState();
}

class _SecurityAppState extends State<SecurityApp> {
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
          'Segurança e Privacidade',
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
                'Alterar senha',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18), // Aumenta o tamanho da fonte do título
              ),
              subtitle: const Text(
                'Mudar senha',
                style: TextStyle(
                    color: Color.fromARGB(186, 158, 158, 158),
                    fontSize: 16), // Aumenta o tamanho da fonte do subtítulo
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/changpass');
              },
            ),
            const Divider(
                color: Color.fromARGB(122, 117, 117,
                    117)), // Linha de separação abaixo do subtítulo
            ListTile(
              title: const Text(
                'Usuários bloqueados',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18), // Aumenta o tamanho da fonte do título
              ),
              subtitle: const Text(
                'Gerenciar usuários bloqueados',
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
                'Gerenciar Storys',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18), // Aumenta o tamanho da fonte do título
              ),
              subtitle: const Text(
                'Restringidos',
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
