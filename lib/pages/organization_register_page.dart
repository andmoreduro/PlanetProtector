import 'package:flutter/material.dart';
import 'package:planet_protector/components/my_button.dart';
import 'package:planet_protector/components/my_text_field.dart';

class OrganizationRegisterPage extends StatefulWidget {
  final Function()? onTapLabelFunction;
  
  const OrganizationRegisterPage({super.key, required this.onTapLabelFunction});

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
      backgroundColor: Colors.green,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.amber,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon( Icons.corporate_fare,
                  size: 150,
                  color: Colors.white
                ),
                const SizedBox(height: 15.0),
                MyTextField(
                  controller: nameTextController,
                  hintText: 'Nombre',
                  obscureText: false,
                ),
                const SizedBox(height: 15.0),
                MyTextField(
                  controller: nitTextController,
                  hintText: 'NIT',
                  obscureText: false,
                ),
                const SizedBox(height: 15.0),
                MyTextField(
                  controller: emailTextController,
                  hintText: 'Correo',
                  obscureText: false,
                ),
                const SizedBox(height: 15.0),
                MyTextField(
                  controller: passwordTextController,
                  hintText: 'Contraseña',
                  obscureText: true,
                ),
                const SizedBox(height: 15.0),
                MyTextField(
                  controller: passwordConfirmationTextController,
                  hintText: 'Confirma contraseña',
                  obscureText: true,
                ),
                const SizedBox(height: 25.0),
                MyButton(onTap: () {}, text: 'Registrar'),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: widget.onTapLabelFunction,
                  child: const Text('¿Quieres participar en voluntariados?',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ), 
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}