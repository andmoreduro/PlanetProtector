import "dart:io";

import "package:image_picker/image_picker.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:planet_protector/components/my_buttons.dart";
import "package:planet_protector/components/my_text_fields.dart";

class VolunteerRegisterPage extends StatefulWidget {
  const VolunteerRegisterPage({super.key});
  
  @override
  State<VolunteerRegisterPage> createState() => _VolunteerRegisterPageState();
}

class _VolunteerRegisterPageState extends State<VolunteerRegisterPage> {
  XFile? _pictureTaken;

  final nameTextController = TextEditingController();
  final surnameTextController = TextEditingController();
  final documentNumberTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final passwordConfirmationTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon( Icons.person,
                  size: 150,
                  color: Colors.white
                ),
                const SizedBox(height: 15),
                RegularTextField(
                  textEditingController: nameTextController,
                  hintText: 'Tu(s) nombre(s)',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 15),
                RegularTextField(
                  textEditingController: surnameTextController,
                  hintText: 'Tu(s) apellido(s)',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: RegularTextField(
                        textEditingController: documentNumberTextController,
                        hintText: 'Número de documento',
                        textInputType: TextInputType.number,
                      ),
                    ),
                    Material(
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () async {
                          final picture = await ImagePicker().pickImage(source: ImageSource.camera);
                          setState(() {
                            _pictureTaken = picture;
                          });
                        },
                        child: _pictureTaken == null ? const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon( Icons.add_a_photo,
                            size: 50,
                          ),
                        ) : Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.file( File(_pictureTaken!.path),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                RegularTextField(
                  textEditingController: emailTextController,
                  hintText: 'Correo electrónico',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                RegularTextField(
                  textEditingController: passwordTextController,
                  hintText: 'Contraseña',
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                RegularTextField(
                  textEditingController: passwordConfirmationTextController,
                  hintText: 'Confirmar contraseña',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                RegularButton(
                  onPressed: nameTextController.text.isEmpty ||
                    surnameTextController.text.isEmpty ||
                    documentNumberTextController.text.isEmpty ||
                    emailTextController.text.isEmpty ||
                    passwordTextController.text.isEmpty ||
                    passwordConfirmationTextController.text.isEmpty ||
                    _pictureTaken == null ? null : () {},
                  text: 'Regístrame'
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () => context.goNamed('organization_register'),
                  child: const Text( '¿Quieres ofrecer voluntariados?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
