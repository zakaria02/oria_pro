import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../utils/constants/oria_colors.dart';

class OriaSearchDropDown<T> extends StatefulWidget {
  const OriaSearchDropDown({
    super.key,
    required this.items,
    required this.onSelected,
    this.selectedItem,
    required this.controller,
  });
  final List<T> items;
  final Function(T?) onSelected;
  final T? selectedItem;
  final TextEditingController controller;

  @override
  State<OriaSearchDropDown<T>> createState() => _OriaSearchDropDownState<T>();
}

class _OriaSearchDropDownState<T> extends State<OriaSearchDropDown<T>> {
  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  @override
  void initState() {
    if (widget.selectedItem != null) {
      widget.controller.text = widget.selectedItem.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(
        20,
        12,
        10,
        12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: OriaColors.iconButtonBackgound,
      ),
      child: TypeAheadField<T>(
        controller: widget.controller,
        builder: (context, controller, focusNode) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: inputBorder,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: OriaColors.iconButtonBackgound,
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: OriaColors.primaryColor,
              ),
            ),
            style: Theme.of(context).textTheme.displayMedium,
          );
        },
        suggestionsCallback: (pattern) {
          return widget.items
              .where((item) => (item
                  .toString()
                  .toLowerCase()
                  .contains(pattern.toLowerCase())))
              .toList();
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(
              suggestion.toString(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          );
        },
        onSelected: (suggestion) {
          setState(() {
            String suggestionText = suggestion.toString();
            if (suggestionText.isEmpty) {
              widget.controller.text =
                  widget.selectedItem?.toString() ?? suggestionText;
            } else {
              widget.controller.text = suggestion.toString();
            }
          });
          widget.onSelected(suggestion);
        },
        hideOnEmpty: true,
      ),
    );
  }
}
