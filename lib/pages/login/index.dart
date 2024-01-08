import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Estilo para o ElevatedButton
  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.blue,
    onPrimary: Colors.white,
    textStyle: TextStyle(fontSize: 18),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  // Estilo para o TextButton
  final ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.red,
    textStyle: const TextStyle(fontSize: 16),
    padding: const EdgeInsets.all(15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(
          color: Colors.red), // Adicionando borda ao TextButton
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Estilos para Botões')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Ação ao pressionar o ElevatedButton
                },
                style: elevatedButtonStyle,
                child: Text('ElevatedButton'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Ação ao pressionar o TextButton
                },
                style: textButtonStyle,
                child: Text('TextButton'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
