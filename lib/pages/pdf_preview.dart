import 'package:flutter/material.dart';
import 'package:lec7/cv_model.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:lec7/pdfexport.dart';

class PdfPreviewPage extends StatelessWidget {
  final Cv cv;
  const PdfPreviewPage({Key? key, required this.cv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        initialPageFormat: PdfPageFormat.standard,
        build: (context) {
          
          return makePdf(cv);
        },
      ),
    );
  }
}
