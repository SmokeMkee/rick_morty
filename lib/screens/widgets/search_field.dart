import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {Key? key, this.onChanged, required this.title, this.controller})
      : super(key: key);
  final ValueChanged<String>? onChanged;
  final String title;
  final String? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: controller),
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: AppColors.searchTextFieldColor,
        filled: true,
        hintText: title,
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.iconColor,
          size: 30,
        ),
        suffixIcon: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.black),
            ),
          ),
          child: const Icon(
            Icons.filter_list_alt,
            size: 30,
            color: AppColors.iconColor,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
