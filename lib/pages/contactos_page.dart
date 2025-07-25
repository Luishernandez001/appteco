import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class ContactosPage extends StatelessWidget {
  const ContactosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Contactos'),
        backgroundColor: const Color(0xFF0077FF),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Información de Contactos',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
} 