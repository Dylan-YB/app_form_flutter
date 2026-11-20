/// Usuarios de demostración. Nunca almacenar contraseñas en texto plano en producción.
const Map<String, Map<String, String>> demoUsers = {
  'dylan@gmail.com': {
    'password': '123456',
    'name': 'DylanYB',
    'role': 'Administrador',
    'avatar': 'https://i.pravatar.cc/150?img=12',
  },
  'maria@gmail.com': {
    'password': 'maria123',
    'name': 'María García',
    'role': 'Diseñadora',
    'avatar': 'https://i.pravatar.cc/150?img=47',
  },
  'carlos@gmail.com': {
    'password': 'carlos123',
    'name': 'Carlos Pérez',
    'role': 'Desarrollador',
    'avatar': 'https://i.pravatar.cc/150?img=14',
  },
};
