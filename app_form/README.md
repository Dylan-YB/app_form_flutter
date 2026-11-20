# app_form — Flutter + GoRouter

Proyecto académico con login, validación, mapa de usuarios, dashboard y logout.

## Requisitos
- Flutter SDK y Visual Studio Code con extensiones Flutter y Dart.
- Navegador Chrome, emulador Android o dispositivo configurado.

## Ejecutar
```bash
flutter create app_form
```
Si descargaste este repositorio, **no ejecutes ese comando dentro de él**. En la carpeta del proyecto, genera las carpetas de plataforma que no están incluidas:
```bash
flutter create .
flutter pub get
flutter run -d chrome
```
Para Android, usa `flutter run` con un emulador o dispositivo conectado.

## Usuarios de prueba
| Correo | Contraseña | Rol |
|---|---|---|
| dilan@demo.com | 123456 | Administrador |
| maria@demo.com | maria123 | Diseñadora |
| carlos@demo.com | carlos123 | Desarrollador |

## Funcionamiento
1. `main.dart` crea `MaterialApp.router`.
2. `routes/app_router.dart` define `/login` y `/dashboard`, con protección de rutas.
3. `screens/login_screen.dart` valida el formulario mediante `GlobalKey<FormState>` y `TextEditingController`.
4. `services/auth_service.dart` compara correo y contraseña con `data/users.dart`.
5. Al autenticarse, GoRouter redirige al dashboard, que muestra nombre, correo, rol y foto.
6. Al cerrar sesión se limpia el usuario activo y GoRouter vuelve al login.

**Nota:** Es una demostración académica. No uses contraseñas en texto plano ni autenticación local para aplicaciones reales. Las fotos de perfil se cargan desde internet y pueden mostrar un ícono alternativo si falla la conexión.

## Entregar por GitHub
```bash
git init
git add .
git commit -m "Implementar login, GoRouter y dashboard"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/app_form.git
git push -u origin main
```
Primero crea un repositorio vacío llamado `app_form` en GitHub y reemplaza `TU_USUARIO` por tu cuenta. No subas credenciales reales.
