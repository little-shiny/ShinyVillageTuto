// screens/manual_screen.dart
import 'package:flutter/material.dart';

/// Pantalla de manual completo con secciones expandibles
class ManualScreen extends StatelessWidget {
  const ManualScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual Completo'),
        backgroundColor: const Color(0xFF8B6F47),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildManualSection(
            title: 'Introducción al Juego',
            icon: Icons.lightbulb_outline,
            content: 'Shint Village es un juego de exploración y gestión donde el jugador crea su propia isla, interactúa con otros personajes y viaja entre diferentes mundos. El objetivo principal es desarrollar su aldea y descubrir los secretos que esconde cada isla.',
          ),
          
          _buildManualSection(
            title: 'Cómo Empezar',
            icon: Icons.play_arrow,
            content: '1. Desde el menú principal, selecciona "NUEVA PARTIDA".\n2. Introduce un nombre para tu partida y para tu personaje.\n3. Confirma la creación y tu aventura comenzará.\n\nEl jugador aparecerá en su isla inicial, donde podrá explorar libremente.',
          ),
          
      
          
          _buildManualSection(
            title: 'Sistema de Guardado',
            icon: Icons.save,
            content: 'El juego debe guardarse mediante el menú ajustes en el botón de "Guardar partida" para almacenar el progreso',
          ),
          
          _buildManualSection(
            title: 'Viajar Entre Islas',
            icon: Icons.flight_takeoff,
            content: 'Para viajar a otra isla:\n\n1. Presiona el botón "VIAJAR" en la esquina superior izquierda.\n2. Se mostrará una lista de islas disponibles.\n3. Selecciona la isla de destino.\n4. Confirma el viaje presionando "VIAJAR".\n\nCada isla tiene características únicas y diferentes NPCs.',
          ),
          
          _buildManualSection(
            title: 'Ajustes y Personalización',
            icon: Icons.settings,
            content: 'Desde el menú de ajustes, el jugador puede:\n\n- Ajustar el volumen de la música de fondo\n- Modificar el brillo de la pantalla\nEstos ajustes se guardan automáticamente.',
          ),
          
          _buildManualSection(
            title: 'Consejos y Trucos',
            icon: Icons.tips_and_updates,
            content: '\n• Explora cada rincón de las islas para encontrar objetos ocultos.\n• Guarda tu partida con frecuencia para no perder progreso.\n• Visita otras islas regularmente para descubrir nuevos contenidos.',
          ),
        ],
      ),
    );
  }

  /// Construye una sección expandible del manual
  Widget _buildManualSection({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xFF8B6F47), width: 2),
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          leading: Icon(icon, color: const Color(0xFF8B6F47)),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B6F47),
            ),
          ),
          backgroundColor: const Color(0xFFE8D5B7).withOpacity(0.3),
          collapsedBackgroundColor: Colors.white,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}