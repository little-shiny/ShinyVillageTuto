import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen>
    with SingleTickerProviderStateMixin {
  int _currentPage = 0;
  int _currentStep = 0;
  int? _pendingStep;
  final PageController _pageController = PageController();
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  static const _brown = Color(0xFF8B6F47);
  static const _beige = Color(0xFFE8D5B7);

  final List<_TutorialPage> _pages = [
    _TutorialPage(
      title: 'MENÚ PRINCIPAL',
      imagePath: 'assets/tutorial/menu_principal.png',
      steps: [
        _Step(
          position: Offset(0.5, 0.44),
          title: 'Nueva Partida',
          text: 'Pulsa "NUEVA PARTIDA" para iniciar una aventura desde cero y crear tu personaje.',
          color: Color(0xFF4E9E5A),
        ),
        _Step(
          position: Offset(0.5, 0.60),
          title: 'Cargar Partida',
          text: 'Pulsa "CARGAR PARTIDA" para ver tus partidas guardadas y retomar donde lo dejaste.',
          color: Color(0xFF4A7EC4),
        ),
        _Step(
          position: Offset(0.955, 0.07),
          title: 'Ajustes',
          text: 'El icono del engranaje (esquina superior derecha) abre los ajustes de volumen y brillo.',
          color: Color(0xFFD4883A),
        ),
      ],
    ),

    _TutorialPage(
      title: 'CREAR PARTIDA NUEVA',
      imagePath: 'assets/tutorial/crear_partida.png',
      steps: [
        _Step(
          position: Offset(0.5, 0.38),
          title: 'Nombre de la partida',
          text: 'Escribe un nombre para identificar tu partida guardada (por ejemplo: "MiIsla").',
          color: Color(0xFF9B5AC4),
        ),
        _Step(
          position: Offset(0.5, 0.53),
          title: 'Nombre del jugador',
          text: 'Escribe el nombre de tu personaje, que aparecerá en pantalla durante el juego.',
          color: Color(0xFFD45A8A),
        ),
        _Step(
          position: Offset(0.43, 0.76),
          title: 'Confirmar (✓)',
          text: 'Pulsa el botón con la marca de verificación para crear la partida y empezar a jugar.',
          color: Color(0xFF4E9E5A),
        ),
        _Step(
          position: Offset(0.545, 0.76),
          title: 'Cancelar (✗)',
          text: 'Pulsa la X para cancelar y volver al menú principal sin guardar nada.',
          color: Color(0xFFD45A4A),
        ),
      ],
    ),

    _TutorialPage(
      title: 'PARTIDAS GUARDADAS',
      imagePath: 'assets/tutorial/partidas_guardadas.png',
      steps: [
        _Step(
          position: Offset(0.32, 0.37),
          title: 'Información de la partida',
          text: 'Cada entrada muestra el nombre de la partida, el jugador y la fecha del último guardado.',
          color: Color(0xFF4A7EC4),
        ),
        _Step(
          position: Offset(0.54, 0.57),
          title: 'Borrar',
          text: 'El botón "BORRAR" elimina esta partida permanentemente. ¡Esta acción no se puede deshacer!',
          color: Color(0xFFD45A4A),
        ),
        _Step(
          position: Offset(0.77, 0.57),
          title: 'Jugar',
          text: 'Pulsa "JUGAR" para cargar esta partida y continuar tu aventura desde donde la dejaste.',
          color: Color(0xFF4E9E5A),
        ),
        _Step(
          position: Offset(0.5, 0.875),
          title: 'Volver al inicio',
          text: 'El botón con el icono de casita te devuelve al menú principal.',
          color: Color(0xFFD4883A),
        ),
      ],
    ),

    _TutorialPage(
      title: 'AJUSTES DEL JUEGO',
      imagePath: 'assets/tutorial/ajustes.png',
      steps: [
        _Step(
          position: Offset(0.5, 0.34),
          title: 'Volumen de música',
          text: 'Arrastra el control deslizante para subir o bajar el volumen de la música de fondo.',
          color: Color(0xFF4A7EC4),
        ),
        _Step(
          position: Offset(0.5, 0.60),
          title: 'Brillo de pantalla',
          text: 'Arrastra el control deslizante para ajustar la luminosidad de la pantalla.',
          color: Color(0xFFD4C43A),
        ),
        _Step(
          position: Offset(0.93, 0.07),
          title: 'Cerrar ajustes',
          text: 'Pulsa la X para cerrar este menú. Los cambios se aplican automáticamente.',
          color: Color(0xFFD45A4A),
        ),
      ],
    ),

    _TutorialPage(
      title: 'EN EL JUEGO',
      imagePath: 'assets/tutorial/en_juego.png',
      steps: [
        _Step(
          position: Offset(0.115, 0.065),
          title: 'Botón de viaje',
          text: 'Pulsa "VIAJAR..." (esquina superior izquierda) para abrir el menú y viajar a otra isla.',
          color: Color(0xFF4E9E5A),
        ),
        _Step(
          position: Offset(0.233, 0.065),
          title: 'Ajustes del juego',
          text: 'El engranaje abre el menú de pausa con las opciones de ajustes y guardado de partida.',
          color: Color(0xFFD4883A),
        ),
        _Step(
          position: Offset(0.505, 0.49),
          title: 'Tu personaje',
          text: 'Controla tu personaje con las teclas de dirección (↑↓←→) o con WASD. Explora libremente.',
          color: Color(0xFF4A7EC4),
        ),
        _Step(
          position: Offset(0.575, 0.605),
          title: 'Objetos del mundo',
          text: 'Explora la isla para encontrar objetos. Acércate a uno y pulsa ESPACIO para interactuar.',
          color: Color(0xFF9B5AC4),
        ),
      ],
    ),

    _TutorialPage(
      title: 'VIAJAR A OTRA ISLA',
      imagePath: 'assets/tutorial/viajar.png',
      steps: [
        _Step(
          position: Offset(0.19, 0.23),
          title: 'Nombre de la isla',
          text: 'Aquí aparece el nombre de la isla de destino a la que puedes viajar.',
          color: Color(0xFF4A7EC4),
        ),
        _Step(
          position: Offset(0.21, 0.34),
          title: 'Jugador de la isla',
          text: 'Cada isla pertenece a un jugador. ¡Visítalos para explorar sus creaciones!',
          color: Color(0xFF4E9E5A),
        ),
        _Step(
          position: Offset(0.845, 0.34),
          title: 'Confirmar viaje',
          text: 'Pulsa "VIAJAR" para confirmar y teletransportarte a esa isla.',
          color: Color(0xFFD4883A),
        ),
        _Step(
          position: Offset(0.93, 0.07),
          title: 'Cancelar viaje',
          text: 'Pulsa la X para cerrar este menú y quedarte en tu isla actual.',
          color: Color(0xFFD45A4A),
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  _TutorialPage get _page => _pages[_currentPage];

  bool get _isFirst => _currentPage == 0 && _currentStep == 0;
  bool get _isLast =>
      _currentPage == _pages.length - 1 &&
      _currentStep == _page.steps.length - 1;

  void _goToStep(int step) => setState(() => _currentStep = step);

  void _next() {
    if (_currentStep < _page.steps.length - 1) {
      setState(() => _currentStep++);
    } else if (_currentPage < _pages.length - 1) {
      _pendingStep = 0;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  void _prev() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    } else if (_currentPage > 0) {
      _pendingStep = _pages[_currentPage - 1].steps.length - 1;
      _pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5ECD8),
      appBar: AppBar(
        title: Text(
          _page.title,
          style: const TextStyle(fontSize: 14, letterSpacing: 1.2),
        ),
        backgroundColor: _brown,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildProgressBar(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                  _currentStep = _pendingStep ?? 0;
                  _pendingStep = null;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (_, i) => _buildPageContent(_pages[i]),
            ),
          ),
          _buildBottomNav(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    final totalSteps =
        _pages.fold<int>(0, (sum, p) => sum + p.steps.length);
    final completedSteps =
        _pages.take(_currentPage).fold<int>(0, (sum, p) => sum + p.steps.length) +
            _currentStep;
    return LinearProgressIndicator(
      value: (completedSteps + 1) / totalSteps,
      backgroundColor: Colors.grey[300],
      valueColor: const AlwaysStoppedAnimation<Color>(_brown),
      minHeight: 4,
    );
  }

  Widget _buildPageContent(_TutorialPage page) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildAnnotatedImage(page),
          _buildStepDots(page),
          _buildStepPanel(page),
        ],
      ),
    );
  }

  Widget _buildAnnotatedImage(_TutorialPage page) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = w * 9 / 16;
        return SizedBox(
          width: w,
          height: h,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  page.imagePath,
                  fit: BoxFit.fill,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFD4B896),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 48,
                              color: Colors.brown.withValues(alpha: 0.4)),
                          const SizedBox(height: 8),
                          Text(page.title,
                              style: TextStyle(
                                  color: Colors.brown.withValues(alpha: 0.5),
                                  fontSize: 11)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(color: Colors.black.withValues(alpha: 0.12)),
              ),
              ...page.steps.asMap().entries.map(
                    (e) => _buildMarker(
                        e.value, e.key, w, h, e.key == _currentStep),
                  ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMarker(
      _Step step, int idx, double w, double h, bool isActive) {
    const size = 28.0;
    return Positioned(
      left: step.position.dx * w - size / 2,
      top: step.position.dy * h - size / 2,
      child: GestureDetector(
        onTap: () => _goToStep(idx),
        child: AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (_, child) => Transform.scale(
            scale: isActive ? _pulseAnimation.value : 1.0,
            child: child,
          ),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: isActive ? step.color : step.color.withValues(alpha: 0.55),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: isActive ? 2.5 : 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: (isActive ? step.color : Colors.black)
                      .withValues(alpha: isActive ? 0.55 : 0.3),
                  blurRadius: isActive ? 10 : 3,
                  spreadRadius: isActive ? 2 : 0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${idx + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isActive ? 13 : 11,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepDots(_TutorialPage page) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: _beige.withValues(alpha: 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(page.steps.length, (i) {
          final active = i == _currentStep;
          final color = page.steps[i].color;
          return GestureDetector(
            onTap: () => _goToStep(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: active ? 28 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: active ? color : Colors.grey[400],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStepPanel(_TutorialPage page) {
    final step = page.steps[_currentStep];
    final isLastOfPage = _currentStep == page.steps.length - 1;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      transitionBuilder: (child, anim) => FadeTransition(
        opacity: anim,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.04, 0),
            end: Offset.zero,
          ).animate(anim),
          child: child,
        ),
      ),
      child: Container(
        key: ValueKey('${_currentPage}_$_currentStep'),
        margin: const EdgeInsets.fromLTRB(14, 8, 14, 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: step.color, width: 2),
          boxShadow: [
            BoxShadow(
              color: step.color.withValues(alpha: 0.18),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: step.color,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${_currentStep + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      step.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Text(
                    'Paso ${_currentStep + 1} de ${page.steps.length}',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
              child: Text(
                step.text,
                style: const TextStyle(
                  fontFamily: 'sans-serif',
                  fontSize: 14,
                  height: 1.55,
                  color: Color(0xFF333333),
                ),
              ),
            ),

            // Navigation buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: _isFirst ? null : _prev,
                    icon: const Icon(Icons.chevron_left, size: 20),
                    label: const Text('Anterior'),
                    style: TextButton.styleFrom(
                      foregroundColor: _brown,
                      textStyle: const TextStyle(fontSize: 13),
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: _next,
                    icon: Icon(
                      _isLast
                          ? Icons.check_circle_outline
                          : (isLastOfPage
                              ? Icons.arrow_forward
                              : Icons.chevron_right),
                      size: 18,
                    ),
                    label: Text(
                      _isLast
                          ? 'Finalizar'
                          : (isLastOfPage ? 'Sig. sección' : 'Siguiente'),
                      style: const TextStyle(fontSize: 13),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: step.color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(_pages.length, (i) {
              final active = i == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: active ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: active ? _brown : Colors.grey[400],
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          Text(
            'Sección ${_currentPage + 1} de ${_pages.length}',
            style: const TextStyle(
              color: _brown,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _TutorialPage {
  final String title;
  final String imagePath;
  final List<_Step> steps;

  const _TutorialPage({
    required this.title,
    required this.imagePath,
    required this.steps,
  });
}

class _Step {
  final Offset position;
  final String title;
  final String text;
  final Color color;

  const _Step({
    required this.position,
    required this.title,
    required this.text,
    required this.color,
  });
}
