import 'package:flutter/material.dart';

class Customfield extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final bool ob;

  const Customfield({
    super.key,
    required this.ob,
    required this.label,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        fillColor: Colors.blue[600],
        filled: true,

        prefixIcon: Icon(icon),
      ),
      obscureText: ob,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please fill data";
        } else if (label == "Name" && value.length < 3) {
          return "Name must be at least 3 characters";
        } else if (label == "Email" && !value.contains("@gmail.com")) {
          return "Enter a valid Email";
        } else if (label.toLowerCase() == "password" && value.length < 8) {
          return "Password must be more than 8 characters";
        }
        return null;
      },
    );
  }
}
