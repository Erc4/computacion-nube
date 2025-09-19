import 'package:flutter/material.dart';

class IMCModel {
  final double peso;
  final double estatura;

  IMCModel({required this.peso, required this.estatura});

  double get imc => peso / (estatura * estatura);

  String get clasificacion {
    if (imc < 18) {
      return 'Peso Bajo';
    } else if (imc >= 18.0 && imc <= 24.9) {
      return 'Normal';
    } else if (imc >= 25.0 && imc <= 26.9) {
      return 'Sobrepeso';
    } else if (imc >= 27.0 && imc <= 29.9) {
      return 'Obesidad grado I';
    } else if (imc >= 30.0 && imc <= 39.9) {
      return 'Obesidad grado II';
    } else {
      return 'Obesidad grado III';
    }
  }

  String get descripcion {
    if (imc < 18) {
      return 'Necesario valorar signos de desnutrición';
    } else if (imc >= 18 && imc <= 24.9) {
      return 'Peso normal y saludable';
    } else if (imc >= 25 && imc <= 26.9) {
      return 'Ligero sobrepeso';
    } else if (imc >= 27 && imc <= 29.9) {
      return 'Riesgo relativo para desarrollar enfermedades cardiovasculares';
    } else if (imc >= 30 && imc <= 39.9) {
      return 'Riesgo relativo muy alto para el desarrollo de enfermedades cardiovasculares';
    } else {
      return 'Riesgo relativo extremadamente alto para el desarrollo de enfermedades cardiovasculares';
    }
  }

  String get imagenAsset {
    if (imc < 18) {
      return 'assets/pesobajo.png';
    } else if (imc >= 18 && imc <= 24.9) {
      return 'assets/pesonormal.png';
    } else if (imc >= 25 && imc <= 26.9) {
      return 'assets/obesidad.png';
    } else if (imc >= 27 && imc <= 29.9) {
      return 'assets/obesidad1.png';
    } else if (imc >= 30 && imc <= 39.9) {
      return 'assets/obesidad2.png';
    } else {
      return 'assets/gordas.png';
    }
  }

  Color get color {
    if (imc < 18) {
      return Colors.blue;
    } else if (imc >= 18 && imc <= 24.9) {
      return Colors.green;
    } else if (imc >= 25 && imc <= 26.9) {
      return Colors.amber.shade700;
    } else if (imc >= 27 && imc <= 29.9) {
      return Colors.orange;
    } else if (imc >= 30 && imc <= 39.9) {
      return Colors.red;
    } else {
      return Colors.red.shade900;
    }
  }

  IconData get icono {
    if (imc < 18) {
      return Icons.trending_down;
    } else if (imc >= 18 && imc <= 24.9) {
      return Icons.check_circle;
    } else if (imc >= 25 && imc <= 26.9) {
      return Icons.warning_amber;
    } else if (imc >= 27 && imc <= 29.9) {
      return Icons.error_outline;
    } else if (imc >= 30 && imc <= 39.9) {
      return Icons.error;
    } else {
      return Icons.dangerous;
    }
  }
}