import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../utils/app_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.onChanged});
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Color.fromARGB(90, 255, 255, 255),
        selectionHandleColor: Colors.white,
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 24, 24, 24),
          prefixIcon: const Icon(
            IconlyLight.search,
            color: Colors.white,
          ),
          hintText: 'Search Coffee',
          hintStyle:
              TextStyles.font20Regular(context).copyWith(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyles.font20Regular(context).copyWith(color: Colors.white),
        cursorColor: Colors.white,
      ),
    );
  }
}
