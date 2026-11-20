import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.auth});
  final AuthService auth;

  @override
  Widget build(BuildContext context) {
    final user = auth.user!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Dashboard'),
        backgroundColor: const Color(0xFF5754D8),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Cerrar sesión',
            onPressed: auth.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: ListView(
              padding: const EdgeInsets.all(22),
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF5754D8), Color(0xFF9287F5)]),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.network(
                            user['avatar']!,
                            width: 84,
                            height: 84,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 60),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('¡Hola, ${user['name']}!',
                          style: const TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(user['role']!, style: const TextStyle(color: Colors.white70, fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Información de tu cuenta',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Card(
                  child: Column(
                    children: [
                      ListTile(leading: const Icon(Icons.person_outline), title: const Text('Nombre'), subtitle: Text(user['name']!)),
                      const Divider(height: 1),
                      ListTile(leading: const Icon(Icons.email_outlined), title: const Text('Correo'), subtitle: Text(auth.email!)),
                      const Divider(height: 1),
                      ListTile(leading: const Icon(Icons.work_outline), title: const Text('Rol'), subtitle: Text(user['role']!)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(children: [
                      Icon(Icons.verified_user_outlined, color: Colors.green, size: 34),
                      SizedBox(width: 14),
                      Expanded(child: Text('Sesión iniciada correctamente. ¡Bienvenido a App Form!')),
                    ]),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: auth.logout,
                  icon: const Icon(Icons.logout),
                  label: const Text('Cerrar sesión'),
                  style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
