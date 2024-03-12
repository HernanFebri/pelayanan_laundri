import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final double height;
  final String topLabel;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType; // Tambahkan properti keyboardType

  const InputWidget({
    Key? key,
    required this.hintText,
    this.height = 48.0,
    this.topLabel = "",
    this.obscureText = false,
    this.validator,
    required this.keyboardType, // Tambahkan parameter keyboardType ke constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(topLabel),
        const SizedBox(height: 5.0),
        Container(
          height: ScreenUtil().setHeight(height),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            obscureText: obscureText,
            keyboardType: keyboardType, // Set keyboardType sesuai dengan parameter
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14.0,
                color: Color.fromRGBO(105, 108, 121, 0.7),
              ),
            ),
            validator: validator,
          ),
        )
      ],
    );
  }
}
