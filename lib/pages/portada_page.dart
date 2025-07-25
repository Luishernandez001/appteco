import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/mission_vision_valores_widget.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/vida_estudiantil_widget.dart';
import '../widgets/nuestro_ecosistema_widget.dart';
import '../widgets/contact_form_widget.dart';

class PortadaPage extends StatefulWidget {
  const PortadaPage({Key? key}) : super(key: key);

  @override
  State<PortadaPage> createState() => _PortadaPageState();
}

class _PortadaPageState extends State<PortadaPage> {
  static const _imgList = [
    'assets/carusel1.jpeg',
    'assets/carusel2.jpeg',
    'assets/carusel3.jpeg',
    'assets/carusel4.jpeg',
  ];

  final ScrollController _scrollController = ScrollController();

  final _portadaKey = GlobalKey();
  final _institucionKey = GlobalKey();
  final _vidaKey = GlobalKey();
  final _titulosKey = GlobalKey();
  final _contactosKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(onNavigate: (route) {
        switch (route) {
          case '/':
            _scrollTo(_portadaKey);
            break;
          case '/institucion':
            _scrollTo(_institucionKey);
            break;
          case '/vida-estudiantil':
            _scrollTo(_vidaKey);
            break;
          case '/nuestro-ecosistema':
            _scrollTo(_titulosKey);
            break;
          case '/contactos':
            _scrollTo(_contactosKey);
            break;
          default:
        }
      }),
      appBar: AppBar(
        title: const Text('Portada', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF00101E),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            KeyedSubtree(
              key: _portadaKey,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // Carrusel con logo sobrepuesto
                  Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          enlargeCenterPage: true,
                        ),
                        items: _imgList
                            .map((e) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    e,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ))
                            .toList(),
                      ),
                      Positioned(
                        top: 8,
                        left: 40,
                        child: Image.asset('assets/logo1.png', height: 35),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    '¿Quiénes somos?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00101E), 
                    ),
                  ),
                ],
              ),
            ),
            KeyedSubtree(key: _institucionKey, child: const MissionVisionValoresWidget()),
            KeyedSubtree(key: _vidaKey, child: const VidaEstudiantilWidget()),
            KeyedSubtree(key: _titulosKey, child: const NuestroEcosistemaWidget()),
            KeyedSubtree(key: _contactosKey, child: const ContactFormWidget()),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _SectionPlaceholder extends StatelessWidget {
  final String title;
  const _SectionPlaceholder({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFF00101E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF00101E),
        ),
      ),
    );
  }
} 