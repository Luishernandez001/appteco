import 'package:flutter/material.dart';

class VidaEstudiantilWidget extends StatelessWidget {
  const VidaEstudiantilWidget({Key? key}) : super(key: key);

  static const _images = [
    'assets/carusel1.jpeg',
    'assets/carusel2.jpeg',
    'assets/carusel3.jpeg',
    'assets/carusel4.jpeg',
    'assets/carusel5.jpeg',
    'assets/carusel6.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Vida Estudiantil',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Explora las actividades, eventos y experiencias que enriquecen la vida de nuestros estudiantes.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: _images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
} 