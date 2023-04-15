import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final List<String> autofillHints;
  final ValueSetter<String> onChanged;
  final Function(String)? onFieldSubmitted;
  final VoidCallback onEditingComplete;
  final Widget? suffixIcon;
  final bool obscureText;

  const InputTextField({
    required this.label,
    required this.icon,
    required this.controller,
    required this.focusNode,
    required this.keyboardType,
    required this.autofillHints,
    required this.onChanged,
    required this.onEditingComplete,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.suffixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          prefixIcon: Icon(icon, color: Colors.grey),
          suffixIcon: suffixIcon,
        ),
        style: const TextStyle(fontSize: 18, color: Colors.black),
        obscureText: obscureText,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        autofillHints: autofillHints,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('label', label));
    properties.add(DiagnosticsProperty<IconData>('icon', icon));
    properties.add(DiagnosticsProperty<TextEditingController>('controller', controller));
    properties.add(DiagnosticsProperty<FocusNode>('focusNode', focusNode));
    properties.add(DiagnosticsProperty<TextInputType>('keyboardType', keyboardType));
    properties.add(IterableProperty<String>('autofillHints', autofillHints));
    properties.add(ObjectFlagProperty<Function(String)>.has('onChanged', onChanged));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onEditingComplete', onEditingComplete));
    properties
        .add(ObjectFlagProperty<Function(String p1)>.has('onFieldSubmitted', onFieldSubmitted));
    properties.add(DiagnosticsProperty<bool>('obscureText', obscureText));
  }
}
