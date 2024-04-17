import 'package:flutter/material.dart';
import 'package:web/model/media.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override Widget build(BuildContext context) {
    return SizedBox(
      height: Media.height()*0.03,
      child: TextField(
        maxLines: 1,
        style: Media.themeQ().textTheme.labelSmall,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          prefixIcon:
          Icon(Icons.search, color: Theme.of(context).iconTheme.color),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
          contentPadding: EdgeInsets.zero,
          hintText: 'Search',
          hintStyle: Media.themeQ().textTheme.labelSmall
        ),
      ),
    );
  }
}