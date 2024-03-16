import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lec7/custom_form_field.dart';
import 'package:lec7/cv_model.dart';
import 'package:lec7/pages/pdf_preview.dart';

class CreateCvScreen extends StatefulWidget {
  CreateCvScreen({super.key});

  @override
  State<CreateCvScreen> createState() => _CreateCvScreenState();
}

class _CreateCvScreenState extends State<CreateCvScreen> {
  File? selectedImage;
  Uint8List? photo;

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create cv'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextButton(
                onPressed: () async {
                  final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

                  if (returnedImage == null) return;
                  setState(() {
                    selectedImage = File(returnedImage!.path);
                  });
                  photo = await returnedImage.readAsBytes();
                },
                child: Text('pick image'),
              ),
              const SizedBox(
                height: 16,
              ),
              selectedImage != null
                  ? Image.file(
                      selectedImage!,
                      height: 100,
                      width: 100,
                    )
                  : Text('select image'),
              CustomFormField(
                textController: firstNameController,
                icon: Icons.person,
                fieldName: 'first name',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormField(
                textController: lastNameController,
                icon: Icons.person,
                fieldName: 'last name',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormField(
                textController: emailController,
                icon: Icons.email,
                fieldName: 'email',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormField(
                textController: phoneNumberController,
                icon: Icons.phone,
                fieldName: 'phone number',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormField(
                textController: descriptionController,
                icon: Icons.description,
                fieldName: 'description',
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () async {
                  final cv = Cv(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    email: emailController.text,
                    phoneNumber: phoneNumberController.text,
                    description: descriptionController.text,
                    photoPath: photo!,
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PdfPreviewPage(cv: cv),
                    ),
                  );
                },
                child: const Text(
                  'create pdf',
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
