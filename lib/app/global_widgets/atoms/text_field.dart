import 'package:agimed/app/core/extensions/string/not_null_and_not_empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/text.dart';
import '../../core/theme/text_theme.dart';
import '../../core/values/colors.dart';

class AtomTextField extends StatefulWidget {
  const AtomTextField({
    Key? key,
    this.inputKey,
    this.controller,
    this.autofocus = false,
    this.backgroundColor = grey30,
    this.borderRadius = 10,
    this.isObscureText = false,
    this.isUnderlined = true,
    this.readOnly = false,
    this.withBorder = true,
    this.leftPadding = 4,
    this.hintText,
    this.label,
    this.validator,
    this.isRequired = true,
    this.onTap,
    this.onChanged,
    this.height = 70,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.textInputAction,
    this.withOverlayError = false,
    this.prefix,
    this.suffix,
    this.startHorizontalPosition = 0.0,
    this.showPropertyName = true,
    this.decoration,
    this.style,
    this.icon,
    this.canBeSpace = false,
  }) : super(key: key);

  final GlobalKey? inputKey;
  final TextEditingController? controller;
  final bool autofocus;
  final bool isObscureText;
  final bool readOnly;
  final bool isUnderlined;
  final bool withBorder;
  final Color backgroundColor;
  final double borderRadius;
  final String? hintText;
  final String? label;
  final double leftPadding;
  final String? Function(String?)? validator;
  final bool isRequired;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final double height;
  final TextInputType textInputType;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final bool withOverlayError;
  final Widget? prefix;
  final Widget? suffix;
  final double startHorizontalPosition;
  final bool showPropertyName;
  final InputDecoration? decoration;
  final TextStyle? style;
  final Icon? icon;
  final bool canBeSpace;

  @override
  _AtomTextFieldState createState() => _AtomTextFieldState();
}

class _AtomTextFieldState extends State<AtomTextField> {
  FocusNode myFocusNode = FocusNode();
  late bool isValidData;
  late String? errorMsg;
  late LayerLink layerLink;
  GlobalKey inputKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;
  late final MouseCursor? mouseCursor;

  @override
  void initState() {
    mouseCursor = widget.readOnly ? SystemMouseCursors.click : null;
    if (widget.inputKey != null) {
      inputKey = widget.inputKey!;
    }
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomText.l(
                  widget.label.toString(),
                  color: grey10,
                ),
              ),
              if (widget.isRequired)
                const Text(
                  "*",
                  style: TextStyle(
                    color: red,
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
              border: widget.withBorder
                  ? Border.all(
                      color: grey10,
                      width: 3,
                    )
                  : null,
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius)),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: (!widget.isUnderlined ||
                            !myFocusNode.hasFocus ||
                            !widget.withBorder) &&
                        isValidData
                    ? null
                    : Border.all(
                        color: white,
                        width: 3,
                      ),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
              ),
              child: Row(
                key: inputKey,
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
                        child: TextFormField(
                          mouseCursor: mouseCursor,
                          controller: widget.controller,
                          autofocus: widget.autofocus,
                          keyboardType: widget.textInputType,
                          readOnly: widget.readOnly,
                          maxLines: widget.maxLines,
                          textInputAction: widget.textInputAction ??
                              (widget.maxLines == null
                                  ? TextInputAction.newline
                                  : TextInputAction.done),
                          autovalidateMode: AutovalidateMode.disabled,
                          onTap: widget.onTap,
                          onChanged: (value) {
                            if (widget.onChanged != null) {
                              widget.onChanged!.call(value);
                            }
                          },
                          focusNode: myFocusNode,
                          expands: widget.maxLines == null ? true : false,
                          decoration: widget.decoration ??
                              InputDecoration(
                                  contentPadding: const EdgeInsets.all(12.0),
                                  border: InputBorder.none,
                                  hintText: widget.hintText,
                                  prefixIcon: widget.icon,
                                  hintStyle: const TextStyle(
                                      color: white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Lato-Regular"),
                                  errorStyle: styleTransparentColor,
                                  errorText: "",
                                  errorMaxLines: 1),
                          validator: validate,
                          obscureText: widget.isObscureText,
                          style: widget.style ??
                              const TextStyle(
                                  fontSize: 16,
                                  color: white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Lato-Regular"),
                        ),
                      ),
                    ),
                  ),
                  if (widget.suffix != null) widget.suffix!,
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

  String? validate(String? value) {
    String? oldMsg = errorMsg;
    if (!widget.canBeSpace) {
      value = value?.trim();
    }
    if (widget.isRequired && !value.isFilled) {
      String fieldName = widget.label ?? widget.hintText ?? "";
      errorMsg = widget.showPropertyName
          ? "the-field".tr + fieldName.toLowerCase() + "is-required".tr
          : "this-field".tr + "is-required".tr;
    } else {
      errorMsg = null;
    }

    if (errorMsg == null && widget.validator != null) {
      errorMsg = widget.validator!(value);
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
                            color: red, borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: CustomText.m(
                            errorMsg ?? "",
                            color: red,
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
