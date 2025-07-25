import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teco_app/pages/titulos_profesionales_page.dart';

import 'pages/portada_page.dart';
import 'pages/institucion_page.dart';
import 'pages/vida_estudiantil_page.dart';
import 'pages/contactos_page.dart';
import 'pages/aula_virtual_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const PortadaPage(),
        ),
        GoRoute(
          path: '/institucion',
          builder: (context, state) => const InstitucionPage(),
        ),
        GoRoute(
          path: '/vida-estudiantil',
          builder: (context, state) => const VidaEstudiantilPage(),
        ),
        GoRoute(
          path: '/nuestro-ecosistema',
          builder: (context, state) => const NuestroEcosistemaPage(),
        ),
        GoRoute(
          path: '/contactos',
          builder: (context, state) => const ContactosPage(),
        ),
        GoRoute(
          path: '/aula-virtual',
          builder: (context, state) => const AulaVirtualPage(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Appteco',
      theme: ThemeData(
        primaryColor: const Color(0xFF0077FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0077FF),
        ),
      ),
      routerConfig: router,
    );
  }
}
