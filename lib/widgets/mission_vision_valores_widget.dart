import 'package:flutter/material.dart';

class MissionVisionValoresWidget extends StatelessWidget {
  const MissionVisionValoresWidget({Key? key}) : super(key: key);

  Widget _buildCard(String title, Widget child, {Color? color}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCard(
          'Misión',
          const Text(
            'Ser los líderes en la transformación técnico digital de la República Dominicana.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        _buildCard(
          'Visión',
          const Text(
            'Ser una institución líder en la transformación técnica digital de la República Dominicana.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          color: Colors.blue.shade100,
        ),
        _buildCard(
          'Valores',
          Column(
            children: const [
              Text('Amor a Dios'),
              Text('Civismo'),
              Text('Responsabilidad'),
              Text('Democracia'),
              Text('Puntualidad'),
              Text('Solidaridad'),
              Text('Honestidad'),
            ],
          ),
          color: Colors.blue.shade50,
        ),
      ],
    );
  }
} 