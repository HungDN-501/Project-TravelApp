import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final String? hint;

  const AppTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.textInputAction,
    required this.obscureText,
    this.prefix,
    this.suffix,
    this.hint,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool hideContent = false;

  @override
  void initState() {
    super.initState();
    hideContent = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.prefix != null) ...[
          widget.prefix!,
          const SizedBox(width: 10),
        ],
        Expanded(
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: hideContent,
            decoration: InputDecoration(
              suffixIcon: widget.obscureText == false
                  ? null
                  : GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            hideContent = !hideContent;
                          },
                        );
                      },
                      child: hideContent
                          ? widget.suffix
                          : const Icon(Icons.remove_red_eye_sharp),
                    ),
              hintText: widget.hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
