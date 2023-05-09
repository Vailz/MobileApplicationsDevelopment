import 'package:flutter/material.dart';
import 'package:showcase_of_computer_components/utils/colors.dart';

class CustomizedTextfield extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController myController;
  final bool Function(String)? validator;

  const CustomizedTextfield({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    required this.myController,
    this.validator,
  }) : super(key: key);

  @override
  _CustomizedTextfieldState createState() => _CustomizedTextfieldState();
}

class _CustomizedTextfieldState extends State<CustomizedTextfield> {
  bool _obscureText = true;
  String? _errorText;

  void _validateInput(String input) {
    if (widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(input) ? null : 'Неправильный формат';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        keyboardType: widget.isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: !widget.isPassword,
        autocorrect: !widget.isPassword,
        obscureText: widget.isPassword && _obscureText,
        controller: widget.myController,
        textAlignVertical: TextAlignVertical.center,
        onChanged: _validateInput,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: kprimaryClr,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryClr, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryClr, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          filled: true,
          fillColor: lightGrayClr,
          errorText: _errorText,
        ),
      ),
    );
  }
}
