import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../core/theme/text.dart';
import '../../core/values/colors.dart';

class AtomPhoneTextField extends StatefulWidget {
  const AtomPhoneTextField({
    Key? key,
    this.controller,
    this.backgroundColor = grey30,
    this.isUnderlined = true,
    this.readOnly = false,
    this.height = 70,
    this.hintText,
    this.label,
    this.validator,
    this.isRequired = true,
    this.onChanged,
    this.onCountryChanged,
    this.textInputType = TextInputType.number,
    this.maxLines = 1,
    this.withOverlayError = false,
    this.prefix,
    this.startHorizontalPosition = 0.0,
    this.decoration,
    this.style,
    this.autofocus = false,
    required this.toVerify,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool readOnly;
  final bool isUnderlined;
  final Color backgroundColor;
  final double height;
  final void Function(String)? onCountryChanged;
  final String? hintText;
  final String? label;
  final String? Function(String?)? validator;
  final bool isRequired;
  final void Function(String)? onChanged;
  final TextInputType textInputType;
  final int? maxLines;
  final bool withOverlayError;
  final Widget? prefix;
  final double startHorizontalPosition;
  final InputDecoration? decoration;
  final TextStyle? style;
  final bool toVerify;
  final bool autofocus;

  @override
  _AtomPhoneTextFieldState createState() => _AtomPhoneTextFieldState();
}

class _AtomPhoneTextFieldState extends State<AtomPhoneTextField> {
  FocusNode myFocusNode = FocusNode();
  late bool isValidData;
  late String? errorMsg;
  late LayerLink layerLink;
  GlobalKey inputKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;
  late final MouseCursor? mouseCursor;
  int maxLength = 8;
  int minLength = 8;

  @override
  void initState() {
    mouseCursor = widget.readOnly ? SystemMouseCursors.click : null;
    layerLink = LayerLink();
    isValidData = true;
    errorMsg = null;
    myFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    closeOverlay();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.toVerify) {
      validate(PhoneNumber(
        countryISOCode: '',
        number: widget.controller?.text ?? "",
        countryCode: '',
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomText.l(
                  widget.label!.toString(),
                  color: grey10,
                ),
              ),
              if (widget.isRequired)
                const Text(
                  "*",
                  style: TextStyle(
                    color: Colors.red,
                    height: 1,
                    letterSpacing: 8,
                  ),
                ),
            ],
          ),
        SizedBox(
          height: widget.height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: grey10,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: DecoratedBox(
              decoration: isValidData
                  ? BoxDecoration(
                      border: (!widget.isUnderlined || !myFocusNode.hasFocus) &&
                              isValidData
                          ? null
                          : Border.all(
                              color: secondColor,
                              width: 1,
                            ),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    )
                  : BoxDecoration(
                      border: (!widget.isUnderlined || !myFocusNode.hasFocus) &&
                              isValidData
                          ? null
                          : Border.all(
                              color: white,
                              width: 1,
                            ),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
              child: Row(
                children: [
                  if (widget.prefix != null) widget.prefix!,
                  Expanded(
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        if (widget.withOverlayError) {
                          if (hasFocus) {
                            initOverlay(context);
                          } else {
                            closeOverlay();
                          }
                        }
                      },
                      child: CompositedTransformTarget(
                        link: layerLink,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 8),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IntlPhoneField(
                                key: inputKey,
                                autofocus: widget.autofocus,
                                controller: widget.controller,
                                focusNode: myFocusNode,
                                keyboardType: TextInputType.number,
                                initialCountryCode: "TN",
                                readOnly: widget.readOnly,
                                style: const TextStyle(color: white),
                                autovalidateMode: AutovalidateMode.disabled,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: widget.decoration ??
                                    InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 4, top: 8.0),
                                      border: InputBorder.none,
                                      hintText: widget.hintText,
                                      hintStyle: const TextStyle(
                                        color: white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto",
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Colors.transparent),
                                      errorText: "",
                                      errorMaxLines: 1,
                                      helperText: "",
                                      counterText: "",
                                      counterStyle: const TextStyle(
                                          color: Colors.transparent),
                                    ),
                                validator: validate,
                                onCountryChanged: (value) {
                                  widget.onCountryChanged?.call(value.dialCode);
                                  minLength = value.minLength;
                                  maxLength = value.maxLength;
                                },
                                showDropdownIcon: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (errorMsg != null && !widget.withOverlayError)
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomText.m(
              errorMsg ?? "",
              color: darkRed,
            ),
          )
      ],
    );
  }

  String? validate(PhoneNumber? value) {
    String? oldMsg = errorMsg;
    if (widget.isRequired && value!.number.trim().isEmpty) {
      errorMsg = "${"the-field".tr} ${widget.label} ${"is-required".tr}";
    } else if (value!.number.length < minLength ||
        value.number.length > maxLength) {
      errorMsg =
          "${"thisPhoneNumberNotValidTheLengthMustBe".tr}$minLength ${"character".tr}";
    } else {
      errorMsg = null;
    }

    if (errorMsg == null && widget.validator != null) {
      errorMsg = widget.validator!(value.number);
    }

    if (errorMsg == null) {
      isValidData = true;
    } else {
      isValidData = false;
    }

    if (widget.withOverlayError) {
      if (myFocusNode.hasFocus) {
        initOverlay(context);
      } else {
        closeOverlay();
      }
    }

    if (oldMsg != errorMsg) {
      setState(() {});
    }
    return isValidData ? null : "";
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => isValidData
          ? const SizedBox()
          : FittedBox(
              fit: BoxFit.cover,
              child: CompositedTransformFollower(
                link: layerLink,
                offset: Offset(widget.startHorizontalPosition, 55),
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Material(
                    color: Colors.transparent,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: CustomText.m(
                            errorMsg ?? "",
                            color: white,
                          ),
                        )),
                  ),
                ),
              ),
            ),
    );
  }

  void initOverlay(context) {
    closeOverlay();
    _overlayEntry = _createOverlayEntry();
    _overlayState = Overlay.of(context!);
    _overlayState!.insert(_overlayEntry!);
  }

  void closeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
