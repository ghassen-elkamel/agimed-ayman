import 'package:agimed/app/global_widgets/atoms/text_field.dart';
import 'package:flutter/material.dart';

class AtomSearch extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final void Function()? onTap;
  final void Function(String)? onSearch;
  final void Function()? closeSearch;
  final double height;
  final bool inSearch;
  final TextInputType textInputType;
  final int? maxLines;
  final InputDecoration? decoration;
  final TextStyle? style;

  const AtomSearch({
    Key? key,
    this.controller,
    this.hintText,
    this.onTap,
    this.onSearch,
    this.closeSearch,
    this.height = 40,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.inSearch = false,
    this.decoration,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: AtomTextField(
              controller: controller,
              textInputType: textInputType,
              maxLines: maxLines,
              onTap: onTap,
              onChanged: (value) {
                onSearch?.call(value);
              },
              decoration: decoration ??
                  InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    border: InputBorder.none,
                    hintText: hintText,
                    suffixIcon: !inSearch
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                            ),
                          )
                        : IconButton(
                            onPressed: closeSearch,
                            icon: const Icon(Icons.close),
                          ),
                  ),
              style: style ??
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lato-Regular",
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
