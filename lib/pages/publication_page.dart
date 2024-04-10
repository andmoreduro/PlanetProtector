import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:planet_protector/components/geo_map.dart';
import 'package:planet_protector/components/my_text_fields.dart';

class PublicationPage extends StatefulWidget {
  const PublicationPage({super.key});

  @override
  State<PublicationPage> createState() => _PublicationPageState();
}

class _PublicationPageState extends State<PublicationPage> {
  XFile? _selectedPicture;

  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionTextController = TextEditingController();
  final TextEditingController participationLimitTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Material(
                    color: Theme.of(context).highlightColor,
                    child: InkWell(
                      onTap: () async {
                        final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
                        setState(() {
                          _selectedPicture = picture;
                        });
                      },
                      child: _selectedPicture == null ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon( Icons.photo,
                              color: Theme.of(context).primaryColor,
                              size: 150,
                            ),
                            const Text( 'Seleccione una imagen'),
                          ],
                        ),
                      ) : Image.file(File(_selectedPicture!.path)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                RegularTextField(
                  hintText: 'Título',
                  textEditingController: titleTextController
                ),
                const SizedBox(height: 15),
                MultilineTextField(
                  hintText: 'Descripción',
                  textEditingController: descriptionTextController,
                ),
                const SizedBox(height: 15),
                const SizedBox(
                  height: 400,
                  width: 400,
                  child: GeoMap(
                    initialLatLng: LatLng(4.659246397843166, -74.0624288871929),
                  ),
                ),
                const SizedBox(height: 15),
                RegularTextField(
                  hintText: 'Límite de participación',
                  textEditingController: participationLimitTextController,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                const Text( 'Horarios'),
                const Row(
                  children: [

                  ],
                ),
                const SizedBox(height: 15),
                const Text( 'Calendario'),
                DatePickerDialog(firstDate: DateTime.utc(2024), lastDate: DateTime.utc(2025)),
                const SizedBox(height: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}