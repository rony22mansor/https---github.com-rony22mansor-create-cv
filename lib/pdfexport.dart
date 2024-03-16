import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lec7/cv_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

Future<Uint8List> makePdf(Cv cv) async {
  final logo = (await rootBundle.load("assets/logo.jpg")).buffer.asUint8List();
  //final photo = (await rootBundle.load(cv.photoPath)).buffer.asUint8List();

  final pdf = Document();
  pdf.addPage(
    pw.Page(
      margin: const pw.EdgeInsets.all(16),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Header(
            padding: const pw.EdgeInsets.all(8),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Image(
                  pw.MemoryImage(logo),
                  width: 30,
                  height: 30,
                  fit: pw.BoxFit.cover,
                ),
                pw.Text('CV'),
              ],
            ),
          ),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.ClipOval(
                child: pw.Image(
                  height: 80,
                  width: 80,
                  pw.MemoryImage(cv.photoPath),
                  fit: pw.BoxFit.cover,
                ),
              ),
              pw.SizedBox(width: 16),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('${cv.firstName} ${cv.lastName}', style: const pw.TextStyle(fontSize: 22)),
                  pw.SizedBox(height: 8),
                  pw.Text(cv.email, style: const pw.TextStyle(fontSize: 18)),
                  pw.SizedBox(height: 8),
                  pw.Text(cv.phoneNumber, style: const pw.TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 32),
          pw.Text('Description', style: pw.TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          pw.Divider(),
          pw.Paragraph(text: cv.description, textAlign: TextAlign.start),
        ]);
      },
    ),
  );
  return pdf.save();
}
