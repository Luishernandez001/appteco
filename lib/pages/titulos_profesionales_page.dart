import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/nuestro_ecosistema_widget.dart';

class NuestroEcosistemaPage extends StatelessWidget {
  const NuestroEcosistemaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Nuestro Ecosistema'),
        backgroundColor: const Color(0xFF0077FF),
      ),
      body: const SingleChildScrollView(
        child: NuestroEcosistemaWidget(),
      ),
    );
  }
} 