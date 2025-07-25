import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/vida_estudiantil_widget.dart';

class VidaEstudiantilPage extends StatelessWidget {
  const VidaEstudiantilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Vida Estudiantil'),
        backgroundColor: const Color(0xFF0077FF),
      ),
      body: const SingleChildScrollView(
        child: VidaEstudiantilWidget(),
      ),
    );
  }
} 