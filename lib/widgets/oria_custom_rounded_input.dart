import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

import 'oria_rounded_input.dart';

class OriaCustomRoundedDateInput extends StatefulWidget {
  const OriaCustomRoundedDateInput({
    super.key,
    required this.hintText,
    required this.onDateChange,
    this.currentValue,
    this.centerText = true,
  });
  final String hintText;
  final Function(DateTime?) onDateChange;
  final String? currentValue;
  final bool centerText;

  @override
  State<StatefulWidget> createState() => _OriaCustomRoundedDateInputState();
}

class _OriaCustomRoundedDateInputState
    extends State<OriaCustomRoundedDateInput> {
  DateTime? selectedDate;

  Future _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: OriaColors.green,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: OriaColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateChange(selectedDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectedDate(context),
      child: AbsorbPointer(
        child: OriaRoundedInput(
          hintText: widget.hintText,
          isDate: true,
          textStyle: Theme.of(context).textTheme.displayMedium,
          centerText: widget.centerText,
          onDateChange: widget.onDateChange,
          controlelrValue: widget.currentValue,
        ),
      ),
    );
  }
}

class OriaCustomRoundedTextInput extends StatelessWidget {
  const OriaCustomRoundedTextInput(
      {super.key,
      required this.hintText,
      required this.onTextChange,
      this.currentValue});
  final String hintText;
  final Function(String?) onTextChange;
  final String? currentValue;

  @override
  Widget build(BuildContext context) {
    return OriaRoundedInput(
      hintText: hintText,
      textStyle: Theme.of(context).textTheme.displayMedium,
      centerText: true,
      onTextChange: onTextChange,
      initialValue: currentValue,
    );
  }
}

class OriaCustomRoundedSearchInput extends StatelessWidget {
  const OriaCustomRoundedSearchInput(
      {super.key,
      required this.hintText,
      required this.onTextChange,
      this.currentValue});
  final String hintText;
  final Function(String?) onTextChange;
  final String? currentValue;

  @override
  Widget build(BuildContext context) {
    return OriaRoundedInput(
      hintText: hintText,
      textStyle: Theme.of(context).textTheme.displayMedium,
      onTextChange: onTextChange,
      initialValue: currentValue,
      validator: false,
    );
  }
}
