import 'dart:developer' as developer;
import 'package:flutter/material.dart';

void main() {
  runApp(const StudioMochiApp());
}

class StudioMochiApp extends StatelessWidget {
  const StudioMochiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studio Mochi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/',
      routes: {
        '/': (context) => const GenericPage(title: 'Inicio', imageUrl: 'https://raw.githubusercontent.com/valeria4c/imagenes/main/FOTO3.jpg'),
        '/productos': (context) => const GenericPage(title: 'Productos', imageUrl: 'https://raw.githubusercontent.com/valeria4c/imagenes/main/producto%20y%20comercial.jpg'),
        '/empleados': (context) => const GenericPage(title: 'Empleados', imageUrl: 'https://raw.githubusercontent.com/valeria4c/imagenes/main/FOTO1.jpg'),
        '/mascotas': (context) => const GenericPage(title: 'Mascotas', imageUrl: 'https://raw.githubusercontent.com/valeria4c/imagenes/main/mascotas.jpg'),
      },
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            decoration: const BoxDecoration(color: Colors.black87),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://raw.githubusercontent.com/valeria4c/imagenes/main/logo%20mochi.jpg'),
                    radius: 25,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'STUDIO MOCHI',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Av. Principal 123\nTel: +123 456 789\nValeria Herrera Sanchez 6-I\ncontacto@studiomochi.com',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ),
          _drawerItem(context, Icons.home, 'Inicio', '/'),
          _drawerItem(context, Icons.camera_alt, 'Productos', '/productos'),
          _drawerItem(context, Icons.people, 'Empleados', '/empleados'),
          _drawerItem(context, Icons.pets, 'Mascotas', '/mascotas'),
        ],
      ),
    );
  }

  Widget _drawerItem(
      BuildContext context, IconData icon, String text, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class GenericPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  const GenericPage({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        title: Text(title, style: const TextStyle(color: Colors.black87)),
        elevation: 0,
        backgroundColor: Colors.grey.shade300,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                    developer.log('Error al cargar la imagen: $error');
                    developer.log('Stack trace: $stackTrace');
                    return const Icon(Icons.image_not_supported, size: 200, color: Colors.grey);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
