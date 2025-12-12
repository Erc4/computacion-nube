import 'dart:async';
import 'dart:io' show File, HttpClient;
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPage extends StatelessWidget {
  final String? nombre;
  final String? genero;
  final String? imagenurl;

  PdfPage({
    this.nombre,
    this.genero,
    this.imagenurl,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Impresion')),
      body: PdfPreview(
        build: (format) => _generatePdf(format, 'LiMa'),
      ),
    );
  }
  
  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    Uint8List? imageBytes;
    if (imagenurl != null && (imagenurl as String).isNotEmpty) {
      try {
        final String img = imagenurl as String;
        if (img.startsWith('http')) {
          if (kIsWeb) {
            final resp = await http.get(Uri.parse(img));
            if (resp.statusCode == 200) imageBytes = resp.bodyBytes;
          } else {
            final uri = Uri.parse(img);
            final request = await HttpClient().getUrl(uri);
            final response = await request.close();
            imageBytes = await consolidateHttpClientResponseBytes(response);
          }
        } else {
          if (!kIsWeb) {
            final f = File(img);
            if (await f.exists()) {
              imageBytes = await f.readAsBytes();
            }
          }
        }
      } catch (e) {
        print('Error fetching image for PDF: $e');
        imageBytes = null;
      }
    }

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              if (imageBytes != null)
                pw.Container(
                  margin: pw.EdgeInsets.only(
                      top: 30, left: 30, right: 30, bottom: 15),
                  height: 300,
                  width: 300,
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(20),
                    border: pw.Border.all(),
                  ),
                  child: pw.Flexible(child: pw.Image(pw.MemoryImage(imageBytes))),
                )
              else
                pw.Container(
                  margin: pw.EdgeInsets.only(
                      top: 30, left: 30, right: 30, bottom: 15),
                  height: 300,
                  width: 300,
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(20),
                    border: pw.Border.all(),
                  ),
                  child: pw.Center(child: pw.Text('No image')),
                ),
              pw.Container(
                margin: pw.EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                  bottom: 15),
                height: 250,
                width: 500,
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(20),
                  border: pw.Border.all(),
                ),
                child: pw.Center(
                  child: pw.Column(children: [
                    pw.SizedBox(height: 30),
                    pw.Text('Nombre: ',
                      style: pw.TextStyle(
                        fontSize: 25,
                        fontWeight: pw.FontWeight.bold,
                        fontStyle: pw.FontStyle.normal,
                      )),
                    pw.SizedBox(height: 15),
                    pw.Center(
                      child: pw.Text('$nombre ',
                        style: pw.TextStyle(
                          fontSize: 25,
                          fontWeight: pw.FontWeight.normal,
                          fontStyle: pw.FontStyle.italic,
                        )),
                    ),
                    pw.SizedBox(height: 25),
                    pw.Text(
                      'Genero: ',
                      style: pw.TextStyle(
                        fontSize: 25,
                        fontWeight: pw.FontWeight.bold,
                        fontStyle: pw.FontStyle.normal,
                      ),
                    ),
                    pw.SizedBox(height: 15),
                    pw.Center(
                      child: pw.Text('$genero ',
                        style: pw.TextStyle(
                          fontSize: 25,
                          fontWeight: pw.FontWeight.normal,
                          fontStyle: pw.FontStyle.italic,
                        )),
                    ),
                  ])),
                ),
              ],
            );
          },
        ),
      );
    
    try {
      final output = await getTemporaryDirectory();
      final file = File('${output.path}/example.pdf');
      await file.writeAsBytes(await pdf.save());
    } catch (e) {
      // getTemporaryDirectory may not be available on web or in some test
      // environments (MissingPluginException). It's safe to skip writing
      // to disk — the PDF bytes are still returned.
      print('Could not write PDF to temporary directory: $e');
    }

    return pdf.save();
  }
}