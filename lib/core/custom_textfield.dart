import 'package:flutter/material.dart';
import 'package:kan_lazim/core/extensions.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.isPassword,
  });
  final String labelText;
  final bool? isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isSecure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: (widget.isPassword ?? false) ? (_isSecure ? true : false) : false,
      decoration: InputDecoration(
          suffixIcon: (widget.isPassword ?? false)
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSecure = !_isSecure;
                    });
                  },
                  child: Container(
                    constraints: BoxConstraints.loose(Size.zero),
                    alignment: Alignment.center,
                    child: AnimatedCrossFade(
                        firstChild: const Icon(Icons.visibility),
                        secondChild: const Icon(Icons.visibility_off_outlined),
                        crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 350)),
                  ),
                )
              : const SizedBox.shrink(),
          label: Text(
            widget.labelText,
            style: context.textTheme.titleSmall?.copyWith(color: Colors.grey.shade600),
          )),
    );
  }
}
