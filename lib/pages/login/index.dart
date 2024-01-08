import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> emails = [
    'exemplo@email.com',
    'outro@email.com',
    'maisum@email.com',
    // ...outros emails
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Emails'),
        ),
        body: ListView.builder(
          itemCount: emails.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const Icon(Icons.delete),
              ),
              secondaryBackground: Container(
                color: Colors.green,
                alignment: Alignment.centerRight,
                child: const Icon(Icons.archive),
              ),
              child: Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Text('View'),
                  ),
                  title: Text(emails[index]),
                  subtitle: const Text('Assunto do email'),
                  trailing: const Icon(Icons.star_border),
                  onTap: () {
                    // Ação ao clicar no email
                  },
                ),
              ),
              onDismissed: (direction) {
                // Ação ao arrastar para o lado (esquerda ou direita)
                if (direction == DismissDirection.startToEnd) {
                  // Ação ao arrastar para a direita (arquivar, por exemplo)
                } else if (direction == DismissDirection.endToStart) {
                  // Ação ao arrastar para a esquerda (excluir, por exemplo)
                }
              },
            );
          },
        ),
      ),
    );
  }
}
