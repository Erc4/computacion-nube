import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/imc_model.dart' as imc_model;

class IMCCalculatorScreen extends StatefulWidget {
  const IMCCalculatorScreen({super.key});

  @override
  State<IMCCalculatorScreen> createState() => _IMCCalculatorScreenState();
}

class _IMCCalculatorScreenState extends State<IMCCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pesoController = TextEditingController();
  final _estaturaController = TextEditingController();
  
  imc_model.IMCModel? _currentIMC;
  bool _showPreview = false;
  bool _pesoTouched = false;
  bool _estaturaTouched = false;

  @override
  void initState() {
    super.initState();
    _pesoController.addListener(_onFieldChanged);
    _estaturaController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    final pesoText = _pesoController.text;
    final estaturaText = _estaturaController.text;
    
    if (pesoText.isNotEmpty && estaturaText.isNotEmpty) {
      final peso = double.tryParse(pesoText);
      final estatura = double.tryParse(estaturaText);
      
      if (peso != null && estatura != null && peso > 0 && estatura > 0) {
        setState(() {
          _currentIMC = imc_model.IMCModel(peso: peso, estatura: estatura);
          _showPreview = true;
        });
      } else {
        setState(() {
          _showPreview = false;
        });
      }
    } else {
      setState(() {
        _showPreview = false;
      });
    }
  }

  @override
  void dispose() {
    _pesoController.removeListener(_onFieldChanged);
    _estaturaController.removeListener(_onFieldChanged);
    _pesoController.dispose();
    _estaturaController.dispose();
    super.dispose();
  }

  void _calcularIMC() {
    if (_formKey.currentState!.validate() && _currentIMC != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => IMCResultScreen(imc: _currentIMC!),
        ),
      );
    }
  }

  void _limpiarCampos() {
    _pesoController.clear();
    _estaturaController.clear();
    setState(() {
      _showPreview = false;
      _pesoTouched = false;
      _estaturaTouched = false;
    });
  }

  String? _validatePeso(String? value) {
    if (!_pesoTouched && (value == null || value.isEmpty)) return null;
    
    if (value == null || value.isEmpty) {
      return 'Ingrese su peso';
    }
    final peso = double.tryParse(value);
    if (peso == null || peso <= 0) {
      return 'Peso debe ser mayor a 0';
    }
    if (peso > 500) {
      return 'Peso demasiado alto';
    }
    return null;
  }

  String? _validateEstatura(String? value) {
    if (!_estaturaTouched && (value == null || value.isEmpty)) return null;
    
    if (value == null || value.isEmpty) {
      return 'Ingrese su estatura';
    }
    final estatura = double.tryParse(value);
    if (estatura == null || estatura <= 0) {
      return 'Estatura debe ser mayor a 0';
    }
    if (estatura < 0.5 || estatura > 3.0) {
      return 'Estatura entre 0.5 y 3.0 metros';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header con icono
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.calculate,
                        size: 64,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Calcula tu Índice de Masa Corporal',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Ingresa tu peso y estatura para obtener tu IMC',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Campo Peso
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.monitor_weight,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Peso',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _pesoController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Ej: 70.5',
                          suffixText: 'kg',
                          prefixIcon: Icon(Icons.monitor_weight_outlined),
                        ),
                        validator: _validatePeso,
                        onChanged: (value) {
                          setState(() {
                            _pesoTouched = true;
                          });
                        },
                        autovalidateMode: _pesoTouched 
                          ? AutovalidateMode.onUserInteraction 
                          : AutovalidateMode.disabled,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Campo Estatura
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.height,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Estatura',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _estaturaController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Ej: 1.75',
                          suffixText: 'm',
                          prefixIcon: Icon(Icons.height),
                        ),
                        validator: _validateEstatura,
                        onChanged: (value) {
                          setState(() {
                            _estaturaTouched = true;
                          });
                        },
                        autovalidateMode: _estaturaTouched 
                          ? AutovalidateMode.onUserInteraction 
                          : AutovalidateMode.disabled,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Preview en tiempo real
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _showPreview ? null : 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _showPreview ? 1.0 : 0.0,
                  child: _showPreview && _currentIMC != null
                      ? Card(
                          color: _currentIMC!.color.withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.preview,
                                      color: _currentIMC!.color,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Vista Previa',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: _currentIMC!.color,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'IMC: ${_currentIMC!.imc.toStringAsFixed(1)}',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: _currentIMC!.color,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Icon(
                                      _currentIMC!.icono,
                                      color: _currentIMC!.color,
                                      size: 28,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: _currentIMC!.color.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    _currentIMC!.clasificacion,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: _currentIMC!.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Botones
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: FilledButton.icon(
                      onPressed: _showPreview ? _calcularIMC : null,
                      icon: const Icon(Icons.calculate),
                      label: const Text('Ver Resultado'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _limpiarCampos,
                      icon: const Icon(Icons.clear),
                      label: const Text('Limpiar'),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),              
            ],
          ),
        ),
      ),
    );
  }
}


class IMCResultScreen extends StatelessWidget {
  final imc_model.IMCModel imc;

  const IMCResultScreen({Key? key, required this.imc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado IMC'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Tu IMC es:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  imc.imc.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: imc.color,
                  ),
                ),
                const SizedBox(height: 12),
                Icon(
                  imc.icono,
                  color: imc.color,
                  size: 48,
                ),
                Image.asset(
                  imc.imagenAsset,
                  height: 150,
                ),
                const SizedBox(height: 12),
                Text(
                  imc.clasificacion,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: imc.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}