import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_protector/components/my_buttons.dart';
import 'package:planet_protector/components/my_text_fields.dart';

class OrganizationRegisterPage extends StatefulWidget {
  const OrganizationRegisterPage({super.key});

  @override
  State<OrganizationRegisterPage> createState() => _OrganizationRegisterPageState();
}

class _OrganizationRegisterPageState extends State<OrganizationRegisterPage> {
  final nameTextController = TextEditingController();
  final nitTextController = TextEditingController();
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
                const Icon( Icons.corporate_fare,
                  size: 150,
                  color: Colors.white
                ),
                const SizedBox(height: 15),
                RegularTextField(
                  textEditingController: nameTextController,
                  hintText: 'Nombre de la organización',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 15),
                RegularTextField(
                  textEditingController: nitTextController,
                  hintText: 'NIT',
                  textInputType: TextInputType.number,
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
                    nitTextController.text.isEmpty ||
                    emailTextController.text.isEmpty ||
                    passwordTextController.text.isEmpty ||
                    passwordConfirmationTextController.text.isEmpty ? null : () {},
                  text: 'Regístrame'
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () => context.goNamed('person_register'),
                  child: const Text( '¿Quieres participar en voluntariados?',
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