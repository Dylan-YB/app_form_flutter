import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.auth});
  final AuthService auth;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;
  String? _loginError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    final valid = widget.auth.login(
      _emailController.text,
      _passwordController.text,
    );
    if (!valid && mounted) {
      setState(() => _loginError = 'Correo o contraseña incorrectos.');
    }
    // GoRouter redirige automáticamente al dashboard si el login es válido.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Card(
                elevation: 5,
                shadowColor: Colors.black12,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CircleAvatar(
                          radius: 42,
                          backgroundColor: Color(0xFFE8E7FF),
                          child: Icon(Icons.lock_person_rounded, size: 46, color: Color(0xFF5754D8)),
                        ),
                        const SizedBox(height: 20),
                        const Text('Bienvenido de nuevo',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        const Text('Inicia sesión para acceder a tu espacio',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54)),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
                          decoration: const InputDecoration(labelText: 'Correo electrónico', prefixIcon: Icon(Icons.email_outlined)),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) return 'Ingresa tu correo';
                            if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(value.trim())) {
                              return 'Ingresa un correo válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _hidePassword,
                          onFieldSubmitted: (_) => _submit(),
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(_hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                              onPressed: () => setState(() => _hidePassword = !_hidePassword),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Ingresa tu contraseña';
                            if (value.length < 6) return 'Mínimo 6 caracteres';
                            return null;
                          },
                        ),
                        if (_loginError != null) ...[
                          const SizedBox(height: 12),
                          Text(_loginError!, style: const TextStyle(color: Colors.red), textAlign: TextAlign.center),
                        ],
                        const SizedBox(height: 25),
                        FilledButton.icon(
                          onPressed: _submit,
                          icon: const Icon(Icons.login),
                          label: const Text('Iniciar sesión'),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 17),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('Proyecto académico • Flutter + GoRouter',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.black45)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
