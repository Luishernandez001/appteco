import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  /// Callback para navegar dentro de la misma portada.
  /// Si es null, se usa navegación por rutas.
  final void Function(String route)? onNavigate;

  const CustomDrawer({Key? key, this.onNavigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      _DrawerItem('Portada', '/'),
      _DrawerItem('Institución', '/institucion'),
      _DrawerItem('Vida Estudiantil', '/vida-estudiantil'),
      _DrawerItem('Nuestro Ecosistema', '/nuestro-ecosistema'),
      _DrawerItem('Contactos', '/contactos'),
    ];

    return Drawer(
      child: Container(
        color: const Color(0xFF00101E),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            for (var item in items)
              ListTile(
                title: Text(
                  item.label,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                onTap: () {
                  if (onNavigate != null) {
                    onNavigate!(item.route);
                    Navigator.of(context).pop();
                  } else {
                    context.go(item.route);
                  }
                },
              ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD600),
                  foregroundColor: Colors.black,
                ),
                onPressed: () => context.go('/aula-virtual'),
                child: const Text('Aula virtual'),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 24),
              child: Row(
                children: const [
                  Icon(Icons.facebook, color: Colors.white),
                  SizedBox(width: 12),
                  Icon(Icons.photo_camera, color: Colors.white),
                  SizedBox(width: 12),
                  Icon(Icons.play_circle_fill, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem {
  final String label;
  final String route;
  const _DrawerItem(this.label, this.route);
} 