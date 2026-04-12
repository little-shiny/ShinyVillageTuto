// screens/tutorial_screen.dart
import 'package:flutter/material.dart';

/// Pantalla de tutorial interactivo que muestra cada menú del juego
class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  // Lista de páginas del tutorial
  final List<TutorialPage> _pages = [
    TutorialPage(
      title: 'MENÚ PRINCIPAL',
      imagePath: 'assets/tutorial/menu_principal.png',
      annotations: [
        Annotation(
          position: Offset(0.5, 0.35),
          text: 'NUEVA PARTIDA: Inicia un nuevo juego',
          color: Colors.green,
        ),
        Annotation(
          position: Offset(0.5, 0.5),
          text: 'CARGAR PARTIDA: Continúa una partida guardada',
          color: Colors.blue,
        ),
        Annotation(
          position: Offset(0.9, 0.1),
          text: 'AJUSTES: Configura el volumen y brillo',
          color: Colors.orange,
        ),
      ],
      description: 'Desde este menú, el jugador puede comenzar una nueva aventura o continuar donde la dejó.',
    ),
    
    TutorialPage(
      title: 'CREAR PARTIDA',
      imagePath: 'assets/tutorial/crear_partida.png',
      annotations: [
        Annotation(
          position: Offset(0.5, 0.35),
          text: 'Introduce el nombre de tu partida',
          color: Colors.purple,
        ),
        Annotation(
          position: Offset(0.5, 0.5),
          text: 'Introduce el nombre de tu personaje',
          color: Colors.pink,
        ),
        Annotation(
          position: Offset(0.35, 0.75),
          text: 'Confirmar: Crear la partida',
          color: Colors.green,
        ),
        Annotation(
          position: Offset(0.65, 0.75),
          text: 'Cancelar: Volver al menú principal',
          color: Colors.red,
        ),
      ],
      description: 'El jugador personaliza su experiencia eligiendo nombres para la partida y su personaje.',
    ),
    
    TutorialPage(
      title: 'PARTIDAS GUARDADAS',
      imagePath: 'assets/tutorial/partidas_guardadas.png',
      annotations: [
        Annotation(
          position: Offset(0.3, 0.3),
          text: 'Nombre de la partida y última fecha de guardado',
          color: Colors.blue,
        ),
        Annotation(
          position: Offset(0.55, 0.42),
          text: 'BORRAR: Elimina la partida permanentemente',
          color: Colors.red,
        ),
        Annotation(
          position: Offset(0.75, 0.42),
          text: 'JUGAR: Carga esta partida',
          color: Colors.green,
        ),
        Annotation(
          position: Offset(0.5, 0.85),
          text: 'Volver al menú principal',
          color: Colors.orange,
        ),
      ],
      description: 'Aquí se muestran todas las partidas guardadas. El jugador puede eliminarlas o cargarlas.',
    ),
    
    TutorialPage(
      title: 'AJUSTES DEL JUEGO',
      imagePath: 'assets/tutorial/ajustes.png',
      annotations: [
        Annotation(
          position: Offset(0.3, 0.25),
          text: 'VOLUMEN DE MÚSICA: Ajusta la música de fondo',
          color: Colors.blue,
        ),
        Annotation(
          position: Offset(0.8, 0.25),
          text: 'Valor actual del volumen',
          color: Colors.cyan,
        ),
        Annotation(
          position: Offset(0.3, 0.45),
          text: 'BRILLO: Ajusta la luminosidad de la pantalla',
          color: Colors.yellow,
        ),
        Annotation(
          position: Offset(0.8, 0.45),
          text: 'Valor actual del brillo',
          color: Colors.amber,
        ),
      ],
      description: 'El jugador puede configurar el volumen de la música y el brillo de la pantalla según sus preferencias.',
    ),
    
    TutorialPage(
      title: 'EN EL JUEGO',
      imagePath: 'assets/tutorial/en_juego.png',
      annotations: [
        Annotation(
          position: Offset(0.15, 0.1),
          text: 'Botón de viaje: Cambia de isla',
          color: Colors.green,
        ),
        Annotation(
          position: Offset(0.9, 0.1),
          text: 'Menú de pausa y ajustes',
          color: Colors.orange,
        ),
        Annotation(
          position: Offset(0.5, 0.5),
          text: 'Tu personaje: Muévelo con las teclas de dirección',
          color: Colors.blue,
        ),
        Annotation(
          position: Offset(0.6, 0.55),
          text: 'NPCs: Interactúa con ellos presionando ESPACIO',
          color: Colors.purple,
        ),
      ],
      description: 'Mueve tu personaje por la isla, habla con los habitantes y explora el mundo.',
    ),
    
    TutorialPage(
      title: 'VIAJAR A OTRA ISLA',
      imagePath: 'assets/tutorial/viajar.png',
      annotations: [
        Annotation(
          position: Offset(0.3, 0.25),
          text: 'Nombre de la isla de destino',
          color: Colors.blue,
        ),
        Annotation(
          position: Offset(0.3, 0.35),
          text: 'Jugador que habita en esa isla',
          color: Colors.green,
        ),
        Annotation(
          position: Offset(0.85, 0.3),
          text: 'VIAJAR: Confirma el viaje',
          color: Colors.orange,
        ),
      ],
      description: 'El jugador puede viajar a otras islas donde residen otros personajes y explorar nuevos lugares.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial Interactivo'),
        backgroundColor: const Color(0xFF8B6F47),
      ),
      body: Column(
        children: [
          // Indicador de progreso
          LinearProgressIndicator(
            value: (_currentPage + 1) / _pages.length,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF8B6F47)),
          ),
          
          // Páginas del tutorial
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return _buildTutorialPage(_pages[index]);
              },
            ),
          ),
          
          // Navegación inferior
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botón anterior
                ElevatedButton.icon(
                  onPressed: _currentPage > 0
                      ? () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Anterior'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8D5B7),
                    foregroundColor: Colors.black87,
                  ),
                ),
                
                // Indicador de página
                Text(
                  '${_currentPage + 1} / ${_pages.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                // Botón siguiente o finalizar
                ElevatedButton.icon(
                  onPressed: _currentPage < _pages.length - 1
                      ? () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : () {
                          Navigator.pop(context);
                        },
                  icon: Icon(_currentPage < _pages.length - 1 
                      ? Icons.arrow_forward 
                      : Icons.check),
                  label: Text(_currentPage < _pages.length - 1 
                      ? 'Siguiente' 
                      : 'Finalizar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8D5B7),
                    foregroundColor: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Construye una página individual del tutorial con anotaciones
  Widget _buildTutorialPage(TutorialPage page) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la página
            Text(
              page.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B6F47),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Imagen con anotaciones
            _buildAnnotatedImage(page),
            
            const SizedBox(height: 20),
            
            // Descripción
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF8B6F47), width: 2),
              ),
              child: Text(
                page.description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Construye la imagen con las anotaciones interactivas
  Widget _buildAnnotatedImage(TutorialPage page) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF8B6F47), width: 3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          children: [
            // Imagen de fondo (placeholder - el desarrollador debe agregar las imágenes reales)
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: const Color(0xFFD4B896),
                child: Image.asset(
                  page.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Placeholder cuando no existe la imagen
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image, size: 50, color: Colors.grey),
                          const SizedBox(height: 8),
                          Text(
                            page.title,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Anotaciones sobre la imagen
            ...page.annotations.map((annotation) => 
              _buildAnnotationMarker(annotation)
            ).toList(),
          ],
        ),
      ),
    );
  }

  /// Construye un marcador de anotación individual
  Widget _buildAnnotationMarker(Annotation annotation) {
    return Positioned(
      left: annotation.position.dx * 400 - 12, // Ajustar según tamaño real
      top: annotation.position.dy * 225 - 12,
      child: GestureDetector(
        onTap: () {
          // Mostrar tooltip con la explicación
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: const Color(0xFFE8D5B7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Color(0xFF8B6F47), width: 2),
              ),
              content: Text(
                annotation.text,
                style: const TextStyle(fontSize: 14),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Entendido'),
                ),
              ],
            ),
          );
        },
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: annotation.color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.info,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/// Modelo para una página del tutorial
class TutorialPage {
  final String title;
  final String imagePath;
  final List<Annotation> annotations;
  final String description;

  TutorialPage({
    required this.title,
    required this.imagePath,
    required this.annotations,
    required this.description,
  });
}

/// Modelo para una anotación en la imagen
class Annotation {
  final Offset position; // Posición relativa (0.0 a 1.0)
  final String text;
  final Color color;

  Annotation({
    required this.position,
    required this.text,
    required this.color,
  });
}