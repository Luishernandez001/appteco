import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class TitulosProfesionalesPage extends StatelessWidget {
  const TitulosProfesionalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Títulos Profesionales'),
        backgroundColor: const Color(0xFF0077FF),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Contenido de Títulos Profesionales',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
} 