import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants/oria_colors.dart';
import '../utils/constants/svg_assets.dart';

class OriaRoundedInput extends StatefulWidget {
  const OriaRoundedInput({
    super.key,
    required this.hintText,
    this.isEmail = false,
    this.isPhoneNumber = false,
    this.isPassowrd = false,
    this.isDate = false,
    this.passwordVisibility,
    this.textStyle,
    this.centerText = false,
    this.onDateChange,
    this.onTextChange,
    this.initialValue,
    this.controlelrValue,
    this.prefixIcon,
    this.suffixIcon,
    this.validator = true,
    this.borderColor,
    this.isNumber = false,
    this.isCardNumber = false,
    this.isCvv = false,
    this.isExpirationDate = false,
    this.minLines,
    this.borderRadius,
    this.filled = true,
  }) : assert(
            // assert is a normal text
            (!isEmail && !isPassowrd && !isPhoneNumber && !isDate) ||
                // or is an email
                (isEmail && !isPassowrd && !isPhoneNumber && !isDate) ||
                // or is a password
                (!isEmail && isPassowrd && !isPhoneNumber && !isDate) ||
                // or is a phone number
                (!isEmail && !isPassowrd && isPhoneNumber && !isDate) ||
                // or is date
                (!isEmail && !isPassowrd && !isPhoneNumber && isDate) ||
                // assert that [passwordVisibility] is not null if the input is a password
                (isPassowrd && passwordVisibility != null) &&
                    ((initialValue == null && controlelrValue != null) ||
                        (initialValue != null && controlelrValue == null)));
  final String hintText;
  final bool isEmail;
  final bool isPhoneNumber;
  final bool isPassowrd;
  final bool isDate;
  final VoidCallback? passwordVisibility;
  final TextStyle? textStyle;
  final bool centerText;
  final Function(DateTime)? onDateChange;
  final Function(String)? onTextChange;
  final String? initialValue;
  final String? controlelrValue;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool validator;
  final Color? borderColor;
  final bool isNumber;
  final bool isCardNumber;
  final bool isCvv;
  final bool isExpirationDate;
  final int? minLines;
  final double? borderRadius;
  final bool filled;

  @override
  State<StatefulWidget> createState() {
    return _OriaRoundedInputState();
  }
}

class _OriaRoundedInputState extends State<OriaRoundedInput> {
  @override
  Widget build(BuildContext context) {
    final InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
      borderSide: BorderSide(
        color: widget.borderColor ?? OriaColors.dividerColor,
      ),
    );
    return TextFormField(
      readOnly: widget.isDate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      controller: widget.controlelrValue != null
          ? TextEditingController.fromValue(
              TextEditingValue(
                text: widget.controlelrValue!,
                selection: TextSelection.collapsed(
                    offset: widget.controlelrValue!.length),
              ),
            )
          : null,
      decoration: InputDecoration(
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        filled: widget.filled,
        hintStyle: TextStyle(
          color: Theme.of(context).disabledColor,
          fontFamily: "Raleway",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        fillColor: Colors.white,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SvgPicture.asset(
                  widget.prefixIcon!,
                ),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),
        suffixIcon: widget.passwordVisibility != null
            ? Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                child: InkWell(
                  onTap: widget.passwordVisibility,
                  child: SvgPicture.asset(
                    widget.isPassowrd
                        ? SvgAssets.eyeAsset
                        : SvgAssets.eyeActiveAsset,
                  ),
                ),
              )
            : widget.suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                      widget.suffixIcon!,
                    ),
                  )
                : null,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 48,
          maxWidth: 48,
        ),
      ),
      style: widget.textStyle ?? Theme.of(context).textTheme.displayMedium,
      textAlign: widget.centerText ? TextAlign.center : TextAlign.start,
      validator: widget.validator || widget.isCardNumber
          ? (value) {
              if (value == null || value.isEmpty) {
                return "This field is obligatory";
              }
              if (widget.isCardNumber && value.length != 19) {
                return "Incorrect card number";
              }
              if (widget.isExpirationDate && value.length != 5) {
                return "Incorrect date";
              }
              if (widget.isCvv && value.length != 3) {
                return "Incorrect cvv";
              }
              return null;
            }
          : null,
      keyboardType: widget.isNumber ||
              widget.isCardNumber ||
              widget.isExpirationDate ||
              widget.isCvv
          ? TextInputType.number
          : widget.isEmail
              ? TextInputType.emailAddress
              : widget.isPhoneNumber
                  ? TextInputType.phone
                  : widget.isDate
                      ? TextInputType.datetime
                      : TextInputType.text,
      obscureText: widget.isPassowrd,
      obscuringCharacter: "*",
      minLines: widget.minLines,
      maxLines: widget.minLines != null ? widget.minLines! + 10 : 1,
      inputFormatters: [
        if (widget.isCardNumber) CreditCardInputFormatter(),
        if (widget.isExpirationDate) ExpirationDateInputFormatter(),
      ],
      onChanged: (value) {
        if (widget.onTextChange != null) {
          widget.onTextChange!(value);
        }
      },
    );
  }
}

class CreditCardInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    text = text.replaceAll(RegExp(r'(\s)|(\D)'), '');
    int offset = newValue.selection.start;
    var subText =
        newValue.text.substring(0, offset).replaceAll(RegExp(r'(\s)|(\D)'), '');
    int realTrimOffset = subText.length;
    // if (newValue.selection.baseOffset == 0) {
    //   return newValue;
    // }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(
            ' '); // Replace this with anything you want to put after each 4 numbers
      }
      if (nonZeroIndex % 4 == 0 &&
          subText.length == nonZeroIndex &&
          nonZeroIndex > 4) {
        int moveCursorToRigth = nonZeroIndex ~/ 4 - 1;
        realTrimOffset += moveCursorToRigth;
      }
      if (nonZeroIndex % 4 != 0 && subText.length == nonZeroIndex) {
        int moveCursorToRigth = nonZeroIndex ~/ 4;
        realTrimOffset += moveCursorToRigth;
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: realTrimOffset));
  }
}

class ExpirationDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    if (text.length == 2) {
      text += "/";
    } else if (text.length == 3) {
      text = text.replaceAll("/", "");
    }

    return newValue.copyWith(
        text: text, selection: TextSelection.collapsed(offset: text.length));
  }
}
