import 'package:flutter/material.dart';

class NuestroEcosistemaWidget extends StatefulWidget {
  const NuestroEcosistemaWidget({Key? key}) : super(key: key);

  @override
  State<NuestroEcosistemaWidget> createState() => _NuestroEcosistemaWidgetState();
}

class _NuestroEcosistemaWidgetState extends State<NuestroEcosistemaWidget> {
  final PageController _controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    final pages = [
      _academyPrograms(context),
      _academyCard(context),
      _labCard(context),
    ];
    return Column(
      children: [
        const SizedBox(height: 8),
        const Text(
          'Nuestro Ecosistema',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00101E),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 450,
          child: PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double value = 1.0;
                  if (_controller.position.haveDimensions) {
                    final double currentPage = (_controller.page ?? _controller.initialPage.toDouble());
                    value = currentPage - index;
                    value = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0) as double;
                  }
                  return Center(
                    child: Transform.scale(
                      scale: value,
                      child: child,
                    ),
                  );
                },
                child: pages[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _baseCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _academyPrograms(BuildContext context) {
    final courses = [
      'Programación',
      'Flutter',
      'Modelado 3D',
      'Unity',
      'UI/UX',
      'CGI',
      'Met. Ágiles',
    ];
    return _baseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'T-ECO ACADEMY',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'Programa intensivo de 8 meses con metodología Project Based Learning',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return _courseTile(index + 1, courses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _courseTile(int number, String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.teal,
            child: Text('$number', style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _academyCard(BuildContext context) {
    final bullets = [
      'Programa intensivo de 8 meses',
      'Modalidad presencial (L-V)',
      'Project Based Learning',
      '502+ graduados certificados',
      '48% inserción laboral',
      'Horarios: Mañana (9am-1pm) y Tarde (2pm-6pm)',
    ];
    return _infoCard('T-ECO ACADEMY', Icons.school, bullets);
  }

  Widget _labCard(BuildContext context) {
    final bullets = [
      'Desarrollo Web & Móvil',
      'Soluciones de Inteligencia Artificial',
      'Experiencias VR/AR y Metaverso',
      'Cloud & DevOps',
      'Blockchain & Web3',
      'Ciberseguridad y Auditorías',
    ];
    return _infoCard('T-ECO LAB', Icons.code, bullets);
  }

  Widget _infoCard(String title, IconData icon, List<String> bullets) {
    return _baseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.teal, size: 40),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text(
            'Brazo de formación y desarrollo de talento especializado en tecnologías emergentes.',
          ),
          const SizedBox(height: 16),
          for (var item in bullets)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.check, color: Colors.teal, size: 16),
                  const SizedBox(width: 6),
                  Expanded(child: Text(item)),
                ],
              ),
            ),
        ],
      ),
    );
  }
} 