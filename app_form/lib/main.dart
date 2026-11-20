import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'services/auth_service.dart';

void main() {
  runApp(const AppForm());
}

class AppForm extends StatefulWidget {
  const AppForm({super.key});

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  final AuthService _auth = AuthService();
  late final _router = createRouter(_auth);

  @override
  void dispose() {
    _router.dispose();
    _auth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'App Form',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5754D8)),
          scaffoldBackgroundColor: const Color(0xFFF5F7FC),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
          ),
        ),
        routerConfig: _router,
      );
}
