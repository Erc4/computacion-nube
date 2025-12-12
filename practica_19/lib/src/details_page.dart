import 'package:flutter/material.dart';
import 'package:practica_19/src/pdf_preview.dart';
import 'package:practica_19/ui/details_container.dart';
import 'package:practica_19/ui/head_container.dart';

class DetailsPage extends StatelessWidget {
  final String? datosName;
  final String? datosGender;
  final String? datosImage;

  DetailsPage({
    this.datosName,
    this.datosGender,
    this.datosImage,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${datosName ?? ''} Details'),
        backgroundColor: Color(0xFFFF422C),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFF272A3C),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            MyHeadContainer(imagerec: datosImage),
            MyDetailContainer(nom: datosName, sexo: datosGender),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF422C),
        child: Icon(Icons.print_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PdfPage(
                nombre: datosName,
                genero: datosGender,
                imagenurl: datosImage,
              ),
            ),
          );
        },
      ),
    );
  }
}