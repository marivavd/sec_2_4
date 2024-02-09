import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Custom_Field extends StatelessWidget{
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool is_obscure;
  final Function(String?) onchange;
  final Function()? on_tap_suffix;
  final MaskTextInputFormatter?  formatter;

  const Custom_Field({
    super.key, required this.label, required this.hint, required this.controller, required this.onchange, this.is_obscure = false, this.on_tap_suffix, this.formatter
});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8,),
        TextField(
          controller: controller,
          onChanged: onchange,
          inputFormatters: (formatter != null) ? [formatter!] : [],
          obscureText: is_obscure,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.headlineSmall,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  width: 4,
                  style: BorderStyle.none,
                  color: Color.fromARGB(255, 167, 167, 167)
              ),
            ),
            suffix: (on_tap_suffix != null)
                ? GestureDetector(
              onTap: on_tap_suffix,
              child: SizedBox(width: 14, height: 14, child: Image.asset("assets/eye-slash.png"),),
            )
                : null,
          ),
        )
      ],
    );
  }
}
