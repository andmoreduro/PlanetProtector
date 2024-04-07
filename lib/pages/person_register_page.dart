import "package:flutter/material.dart";
import "package:planet_protector/components/my_button.dart";
import "package:planet_protector/components/my_text_field.dart";

class PersonRegisterPage extends StatefulWidget {
  final Function()? onTapLabelFunction;

  const PersonRegisterPage({super.key, required this.onTapLabelFunction});
  
  @override
  State<PersonRegisterPage> createState() => _PersonRegisterPageState();
}

class _PersonRegisterPageState extends State<PersonRegisterPage> {
  final nameTextController = TextEditingController();
  final surnameTextController = TextEditingController();
  final identificationNumberTextController = TextEditingController();
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
                const Icon( Icons.person,
                  size: 150,
                  color: Colors.white
                ),
                const SizedBox(height: 15.0),
                MyTextField(
                  controller: nameTextController,
                  hintText: 'Nombre(s)',
                  obscureText: false,
                ),
                const SizedBox(height: 15.0),
                MyTextField(
                  controller: surnameTextController,
                  hintText: 'Apellido(s)',
                  obscureText: false,
                ),
                const SizedBox(height: 15.0),
                MyTextField(
                  controller: identificationNumberTextController,
                  hintText: 'Número de identificación',
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
                  child: const Text('¿Quieres ofrecer voluntariados?',
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
