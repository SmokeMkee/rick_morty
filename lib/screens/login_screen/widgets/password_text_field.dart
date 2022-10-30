import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../generated/l10n.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      style: _isObscure == true && widget.controller.text.isNotEmpty
          ? const TextStyle(
              letterSpacing: 5.0,
              fontWeight: FontWeight.w600,
            )
          : const TextStyle(),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(242, 242, 242, 1),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: SvgPicture.asset(AppAssets.svg.passwordPrefixIcon),
        ),
        hintText: S.of(context).password,
        suffixIcon: IconButton(
          splashRadius: 1,
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(
              () {
                _isObscure = !_isObscure;
              },
            );
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).inputErrorCheckPassword;
        }
        if (value.length < 8) {
          return S.of(context).inputErrorPasswordIsShort;
        }
        if (value.length > 16) {
          return S.of(context).inputErrorPasswordIsLong;
        }

        return null;
      },
    );
  }
}
