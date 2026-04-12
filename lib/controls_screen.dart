// screens/controls_screen.dart
import 'package:flutter/material.dart';

/// Pantalla que muestra los controles del juego
class ControlsScreen extends StatelessWidget {
  const ControlsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controles del Juego'),
        backgroundColor: const Color(0xFF8B6F47),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Sección: Movimiento
          _buildControlSection(
            title: 'MOVIMIENTO',
            icon: Icons.keyboard_arrow_up,
            controls: [
              ControlItem(
                key: '↑ / W',
                description: 'Mover hacia arriba',
              ),
              ControlItem(
                key: '↓ / S',
                description: 'Mover hacia abajo',
              ),
              ControlItem(
                key: '← / A',
                description: 'Mover hacia la izquierda',
              ),
              ControlItem(
                key: '→ / D',
                description: 'Mover hacia la derecha',
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Sección: Interacción
          _buildControlSection(
            title: 'INTERACCIÓN',
            icon: Icons.touch_app,
            controls: [
              ControlItem(
                key: 'ESPACIO',
                description: 'Interactuar con NPCs y objetos',
              ),
              ControlItem(
                key: 'TAB',
                description: 'Abrir inventario',
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Sección: Menús
          _buildControlSection(
            title: 'MENÚS',
            icon: Icons.menu,
            controls: [
              ControlItem(
                key: 'ESC',
                description: 'Abrir/cerrar menú de pausa',
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Nota adicional
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
        
          ),
        ],
      ),
    );
  }

  /// Construye una sección de controles agrupados
  Widget _buildControlSection({
    required String title,
    required IconData icon,
    required List<ControlItem> controls,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF8B6F47), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado de la sección
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFE8D5B7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: const Color(0xFF8B6F47)),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B6F47),
                  ),
                ),
              ],
            ),
          ),
          
          // Lista de controles
          ...controls.map((control) => _buildControlItem(control)).toList(),
        ],
      ),
    );
  }

  /// Construye un elemento de control individual
  Widget _buildControlItem(ControlItem control) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          // Tecla
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF8B6F47),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              control.key,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Descripción
          Expanded(
            child: Text(
              control.description,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

/// Modelo para un elemento de control
class ControlItem {
  final String key;
  final String description;

  ControlItem({
    required this.key,
    required this.description,
  });
}