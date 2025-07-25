import 'package:flutter/material.dart';
import '../widgets/mission_vision_valores_widget.dart';
import '../widgets/custom_drawer.dart';

class InstitucionPage extends StatelessWidget {
  const InstitucionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Institución'),
        backgroundColor: const Color(0xFF0077FF),
      ),
      body: const SingleChildScrollView(
        child: MissionVisionValoresWidget(),
      ),
    );
  }
} 