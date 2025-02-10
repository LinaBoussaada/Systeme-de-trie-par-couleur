import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final bool obsecureText;
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;

  const CustomTextfield({
    Key? key,
    required this.obsecureText,
    required this.hintText,
    required this.icon,
    this.controller, // Ajout du paramètre `controller`
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

/*import 'package:colorproject/constants.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obsecureText;
  final String hintText;

  const CustomTextfield({
    Key? key,
    required this.icon,
    required this.obsecureText,
    required this.hintText, required TextEditingController controller,
  }) : super(key: key);
//required this.hintText, required TextEditingController controller,
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecureText,
      style: TextStyle(
        color: Constants.blackColor,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          icon,
          color: Constants.blackColor.withOpacity(.3),
        ),
        hintText: hintText,
      ),
      cursorColor: Constants.blackColor.withOpacity(.5),
    );
  }
}
*/