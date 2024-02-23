import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;

  const CustomSearchBar({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          prefixIcon: const Icon(Icons.search),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          )),
    );
  }
}
