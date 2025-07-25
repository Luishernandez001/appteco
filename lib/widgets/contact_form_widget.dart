import 'package:flutter/material.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({Key? key}) : super(key: key);

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _orgCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  String? _area;
  bool _news = false;
  bool _terms = false;
  bool _sending = false;

  late AnimationController _btnController;

  @override
  void initState() {
    super.initState();
    _btnController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
  }

  @override
  void dispose() {
    _btnController.dispose();
    _nameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _orgCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  void _submit() async {
    if (!_formKey.currentState!.validate() || !_terms) return;
    setState(() => _sending = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _sending = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Mensaje enviado ¡Gracias!')),
    );
    _formKey.currentState!.reset();
    _area = null;
    _news = _terms = false;
  }

  Widget _buildTextField(String label, TextEditingController ctrl, {TextInputType? type, String? Function(String?)? validator}) {
    return TextFormField(
      controller: ctrl,
      keyboardType: type,
      validator: validator ?? (v) => v == null || v.trim().isEmpty ? 'Requerido' : null,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scale = 1 - _btnController.value;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '¿Tienes alguna pregunta?',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 4),
            const Text(
              'Completa el formulario y nos pondremos en contacto contigo lo antes posible',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(width: 260, child: _buildTextField('Nombre *', _nameCtrl)),
                SizedBox(width: 260, child: _buildTextField('Apellido *', _lastNameCtrl)),
                SizedBox(
                  width: 260,
                  child: _buildTextField('Correo Electrónico *', _emailCtrl,
                      type: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Requerido';
                        final emailReg = RegExp(r'^.+@.+\..+$');
                        return emailReg.hasMatch(v) ? null : 'Correo inválido';
                      }),
                ),
                SizedBox(width: 260, child: _buildTextField('Teléfono', _phoneCtrl, type: TextInputType.phone, validator: (_) => null)),
                SizedBox(
                  width: 260,
                  child: DropdownButtonFormField<String>(
                    value: _area,
                    items: const [
                      DropdownMenuItem(value: 'Academy', child: Text('Academy')),
                      DropdownMenuItem(value: 'Lab', child: Text('Lab')),
                      DropdownMenuItem(value: 'General', child: Text('General')),
                    ],
                    onChanged: (v) => setState(() => _area = v),
                    validator: (v) => v == null ? 'Seleccione un área' : null,
                    decoration: InputDecoration(
                      labelText: 'Área de interés *',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                SizedBox(width: 260, child: _buildTextField('Empresa / Organización', _orgCtrl, validator: (_) => null)),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField('Mensaje *', _messageCtrl, validator: (v) => v == null || v.trim().isEmpty ? 'Requerido' : null),
            const SizedBox(height: 12),
            CheckboxListTile(
              value: _news,
              onChanged: (v) => setState(() => _news = v ?? false),
              title: const Text('Deseo recibir noticias y actualizaciones de T-ecogroup'),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              value: _terms,
              onChanged: (v) => setState(() => _terms = v ?? false),
              title: const Text('Acepto la Política de Privacidad *'),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTapDown: (_) => _btnController.forward(),
              onTapUp: (_) => _btnController.reverse(),
              onTapCancel: () => _btnController.reverse(),
              onTap: _sending ? null : _submit,
              child: AnimatedBuilder(
                animation: _btnController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: Container(
                  width: 180,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF00B4DB), Color(0xFF00D8A7)]),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: _sending
                        ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Text('Enviar Mensaje', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 