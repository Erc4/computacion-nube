import 'package:flutter/material.dart';
import 'dart:async';
import 'imc_calculator_screen.dart';
import 'models/imc_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _imcController;
  late Animation<double> _logoAnimation;
  late Animation<double> _imcAnimation;
  late Animation<Offset> _slideAnimation;
  
  int _currentExampleIndex = 0;
  Timer? _exampleTimer;
  
  final List<IMCModel> _examples = [
    IMCModel(peso: 70, estatura: 1.75), // Normal
    IMCModel(peso: 85, estatura: 1.70), // Sobrepeso
    IMCModel(peso: 55, estatura: 1.65), // Peso bajo
    IMCModel(peso: 95, estatura: 1.75), // Obesidad I
  ];

  @override
  void initState() {
    super.initState();
    
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    
    _imcController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    );
    
    _imcAnimation = CurvedAnimation(
      parent: _imcController,
      curve: Curves.easeInOut,
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(_imcAnimation);

    _startAnimations();
    _startExampleRotation();
    _navigateToMain();
  }

  void _startAnimations() async {
    await _logoController.forward();
    _imcController.forward();
  }

  void _startExampleRotation() {
    _exampleTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentExampleIndex = (_currentExampleIndex + 1) % _examples.length;
        });
        _imcController.reset();
        _imcController.forward();
      }
    });
  }

  void _navigateToMain() {
    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const IMCCalculatorScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _exampleTimer?.cancel();
    _logoController.dispose();
    _imcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentExample = _examples[_currentExampleIndex];
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo animado
              ScaleTransition(
                scale: _logoAnimation,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.fitness_center,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Título
              FadeTransition(
                opacity: _logoAnimation,
                child: const Column(
                  children: [
                    Text(
                      'Calculadora IMC',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Índice de Masa Corporal',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Ejemplo de cálculo IMC animado
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _imcAnimation,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.monitor_weight, 
                                    color: Colors.blue, size: 24),
                                const SizedBox(height: 4),
                                Text(
                                  '${currentExample.peso.toInt()} kg',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward, color: Colors.grey),
                            Column(
                              children: [
                                const Icon(Icons.height, 
                                    color: Colors.blue, size: 24),
                                const SizedBox(height: 4),
                                Text(
                                  '${currentExample.estatura} m',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 20),
                        
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            color: currentExample.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: currentExample.color,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'IMC: ${currentExample.imc.toStringAsFixed(1)}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: currentExample.color,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                currentExample.clasificacion,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: currentExample.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Indicador de carga
              FadeTransition(
                opacity: _logoAnimation,
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}