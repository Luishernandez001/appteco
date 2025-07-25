import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/contact_form_widget.dart';

class ContactosPage extends StatelessWidget {
  const ContactosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Contactos'),
        backgroundColor: const Color(0xFF00101E),
      ),
      body: const SingleChildScrollView(
        child: ContactFormWidget(),
      ),
    );
  }
} 