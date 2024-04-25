import 'package:flutter/material.dart';

class CTextField extends StatefulWidget {
  const CTextField(
      {super.key,
        required this.label,
        this.validation,
        this.isPassword,
        this.hint,
        this.controller});
  final String label;
  final String? Function(String?)? validation;
  final bool? isPassword;
  final String? hint;
  final TextEditingController? controller;

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  bool _isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        style: const TextStyle(fontSize: 14),
        obscureText: widget.isPassword??false,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint ?? '',
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.surface, fontSize: 12),
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          filled: true,
          suffixIcon: widget.isPassword==true
              ? IconButton(
            icon: Icon(
              _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _isPasswordHidden = !_isPasswordHidden;
              });
            },
          )
              : null,
        ),
        validator: widget.validation,
      ),
    );
  }
}