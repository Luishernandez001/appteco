import 'package:flutter/material.dart';

class MissionVisionValoresWidget extends StatelessWidget {
  const MissionVisionValoresWidget({Key? key}) : super(key: key);

  Widget _buildCard(String title, Widget child, {Color? color}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Color(0xFFE5FBE6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00101E),
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
          'Nuestra Historia',
          const Text(
            'Fundada en 2021, T-ECO GROUP nació con la visión de revolucionar la educación tecnológica en República Dominicana. Hemos formado a más de 502 graduados y mantenemos una tasa de inserción laboral del 48%.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        _buildCard(
          'Misión',
          const Text(
            'Ser los líderes en la transformación técnico digital de la República Dominicana.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          color: Color(0xFFE5FBE6),
        ),
        _buildCard(
          'Visión',
          const Text(
            'Ser una institución líder en la transformación técnica digital de la República Dominicana.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          color: Color(0xFFE5FBE6),
        ),
      ],
    );
  }
} 