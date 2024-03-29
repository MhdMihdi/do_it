import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required String? Function(String? value) validate,
  required String label,
  required IconData prefix,
  TextInputType? type,
  VoidCallback onSubmit(value)?,
  VoidCallback onChange(value)?,
  VoidCallback? onTap,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? suffixFunction,
  double radius = 20.0,
})=>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null
        ? IconButton(
         icon: Icon(
         suffix,
        ),
     onPressed: suffixFunction,
    )
        : null,

    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.teal,
      ),
      borderRadius: BorderRadius.circular(radius),
    ),
  ),
);

Widget myButton({
  required String title,
  required VoidCallback onPressed
})
=>MaterialButton(
  textColor: Colors.white,
  color: Colors.teal,
  onPressed: onPressed,
  elevation: 0.0,
  child: Text(
    title,
  ),

);