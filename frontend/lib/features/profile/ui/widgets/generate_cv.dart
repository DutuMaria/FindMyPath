import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/features/profile/ui/widgets/test_button.dart';
import 'package:frontend/models/user_profile.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class GenerateCV extends StatelessWidget {
  const GenerateCV({super.key, required this.userProfile});

  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    Future<void> generatePDF() async {
      final pdf = pw.Document();

      final netImage = await networkImage(
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png');
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(children: [
              pw.Container(
                width: double.infinity,
                height: 80,
                // color: const PdfColor.fromInt(0xFF7A5C95),
                child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Image(
                        netImage,
                        height: 70,
                        width: 70,
                      ),
                      pw.SizedBox(width: 110),
                      pw.Text(
                          '${userProfile.lastName} ${userProfile.firstName}',
                          style: const pw.TextStyle(fontSize: 20)),
                    ]),
              ),
              pw.SizedBox(height: 50),
              pw.Divider(
                thickness: 1,
                color: PdfColors.grey,
              ),
              pw.Text("Contact", style: const pw.TextStyle(fontSize: 20)),
              pw.Text(userProfile.email,
                  style: const pw.TextStyle(fontSize: 20)),
              pw.Divider(
                thickness: 1,
                color: PdfColors.grey,
              ),
              pw.SizedBox(height: 35),

              // TODO add an education to the user used on presentation
              pw.Divider(
                thickness: 1,
                color: PdfColors.grey,
              ),
              pw.Text("Education", style: const pw.TextStyle(fontSize: 20)),
              pw.Divider(
                thickness: 1,
                color: PdfColors.grey,
              ),
            ]);
          },
        ),
      );

      // Get the directory for saving the PDF
      final directory = await getApplicationDocumentsDirectory();
      final path =
          '${directory.path}/example.pdf'; // Save the PDF to the local device
      final file = File(path);
      await file.writeAsBytes(await pdf.save());

      // Show a dialog to indicate the PDF has been saved
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('PDF Generated'),
          content: Text('PDF has been saved to $path'),
          actions: [
            TestButton(
              onPressed: () {
                Navigator.of(context).pop();
                OpenFile.open(file.path);
              },
              text: ('OK'),
            ),
          ],
        ),
      );
    }

    return Center(
      child: ElevatedButton.icon(
        onPressed: generatePDF,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          backgroundColor: const Color.fromARGB(255, 49, 26, 72),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
        label: const Text("Generate CV"),
      ),
    );
  }
}
