import 'package:flutter/material.dart';

class AulaVirtualPage extends StatelessWidget {
  const AulaVirtualPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula Virtual'),
        backgroundColor: const Color(0xFF0077FF),
      ),
      body: const Center(
        child: Text('En construcción'),
      ),
    );
  }
} 