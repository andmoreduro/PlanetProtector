import 'package:flutter/material.dart';
import 'package:planet_protector/pages/organization_register_page.dart';
import 'package:planet_protector/pages/person_register_page.dart';

class RegisterPageSwitcher extends StatefulWidget {
  const RegisterPageSwitcher({super.key});

  @override
  State<RegisterPageSwitcher> createState() => _RegisterPageSwitcherState();
}

class _RegisterPageSwitcherState extends State<RegisterPageSwitcher> {
  // Muestra inicialmente la página de registro de personas.
  bool showPersonRegisterPage = true;
  bool showOrganizationPage = false;

  // Método para cambiar entre ambas páginas
  void toggleRegisterPage() {
    setState(() {
      showPersonRegisterPage = !showPersonRegisterPage;
      showOrganizationPage = !showOrganizationPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showOrganizationPage) {
      return OrganizationRegisterPage(onTapLabelFunction: toggleRegisterPage);
    }
    return PersonRegisterPage(onTapLabelFunction: toggleRegisterPage);
  }
}
