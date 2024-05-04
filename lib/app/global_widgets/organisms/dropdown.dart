import 'package:flutter/material.dart';

import '../../core/theme/text_theme.dart';
import '../../core/values/colors.dart';
import '../../data/models/item_select.dart';
import '../atoms/text_field.dart';
import '../molecules/dropdown_content.dart';
import '../atoms/image.dart';

class OrganismDropdown<T> extends StatefulWidget {
  OrganismDropdown({
    Key? key,
    this.initValue,
    required this.items,
    this.hintText = "",
    this.isRequired = true,
    this.withBorder = true,
    this.underlineColor = Colors.grey,
    this.backgroundColor = grey30,
    this.label,
    this.padding = 0,
    this.onChange,
    this.height = 200,
    this.isSearchable = false,
  })  : onChangeSelectedItems = null,
        isMultiselect = false,
        controller = TextEditingController(),
        super(key: key);

  const OrganismDropdown.custom({
    Key? key,
    this.initValue,
    required this.controller,
    required this.items,
    this.hintText = "",
    this.isRequired = true,
    this.withBorder = true,
    this.underlineColor = Colors.grey,
    this.backgroundColor = grey30,
    this.label,
    this.padding = 0,
    this.onChange,
    this.height = 200,
    this.isSearchable = false,
  })  : onChangeSelectedItems = null,
        isMultiselect = false,
        super(key: key);

  const OrganismDropdown.multiselect({
    Key? key,
    this.initValue,
    required this.controller,
    required this.items,
    this.hintText = "",
    this.isRequired = true,
    this.withBorder = true,
    this.underlineColor = Colors.grey,
    this.backgroundColor = grey30,
    this.label,
    this.padding = 0,
    this.onChangeSelectedItems,
    this.height = 300,
    this.isSearchable = false,
  })  : onChange = null,
        isMultiselect = true,
        super(key: key);

  final ItemSelect? initValue;
  final bool isMultiselect;
  final TextEditingController controller;
  final String hintText;
  final bool isRequired;
  final bool withBorder;
  final Color underlineColor;
  final Color backgroundColor;
  final String? label;
  final List<ItemSelect> items;
  final double padding;
  final void Function(ItemSelect item)? onChange;
  final void Function(List<ItemSelect> items)? onChangeSelectedItems;
  final bool isSearchable;
  final double height;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<OrganismDropdown> {
  late GlobalKey key;
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;
  bool _isVisible = false;
  ItemSelect? value;
  List<ItemSelect> values = [];
  List<ItemSelect> items = [];

  late LayerLink layerLink;

  @override
  void initState() {
    key = GlobalKey();
    layerLink = LayerLink();
    value = widget.initValue;
    if (value != null && widget.isMultiselect) {
      values.add(value!);
    }
    items = widget.items;
    widget.controller.text = value?.label ?? "";
    items = widget.items;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (items.length != widget.items.length) {
      items = widget.items;
    }

    Icon arrowIcon = Icon(
      _isVisible ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
      color: black,
      size: widget.withBorder ? 16 : 30,
    );
    return WillPopScope(
      onWillPop: () {
        if (_isVisible) {
          closeOverlay();
        }
        return Future.value(true);
      },
      child: SizedBox(
        width: double.infinity,
        child: CompositedTransformTarget(
          link: layerLink,
          child: AtomTextField(
            inputKey: key,
            withBorder: widget.withBorder,
            controller: widget.controller,
            label: widget.label,
            readOnly: true,
            isRequired: widget.isRequired,
            canBeSpace: true,
            prefix: value?.pathPicture == null
                ? null
                : Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: AtomImage(
                      path: value!.pathPicture!,
                      width: 24,
                      height: 24,
                    ),
                  ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: arrowIcon,
              border: InputBorder.none,
              errorStyle: styleTransparentColor,
              errorText: "",
              errorMaxLines: 1,
              contentPadding:
                  const EdgeInsets.only(left: 12, bottom: 0, top: 16),
            ),
            style: styleBlackLightFontRobotoW400Size16,
            onTap: () {
              if (!_isVisible) {
                _isVisible = true;
                _overlayEntry = _createOverlayEntry();
                _overlayState = Overlay.of(context);
                _overlayState!.insert(_overlayEntry!);
              } else {
                closeOverlay();
              }
            },
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);

    bool openOnDown =
        position.dy + widget.height < MediaQuery.of(context).size.height;

    double startPosition = widget.label == null ? 0 : 36;
    if (openOnDown) {
      startPosition += box.size.height;
    }

    return OverlayEntry(
      builder: (context) {
        return FittedBox(
          fit: BoxFit.fill,
          child: InkWell(
            onTap: () => closeOverlay(),
            child: CompositedTransformFollower(
              link: layerLink,
              followerAnchor:
                  openOnDown ? Alignment.topLeft : Alignment.bottomLeft,
              offset: Offset(
                -4,
                startPosition,
              ),
              child: FittedBox(
                fit: BoxFit.none,
                child: SizedBox(
                  height: widget.height,
                  width: box.size.width + 8,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: secondColor.withOpacity(0.4)),
                    ),
                    child: StatefulBuilder(
                        builder: (context, setStateDropdownContent) {
                      return MoleculeDropdownContent(
                        onTap: (item) {
                          value = item;
                          if (widget.isMultiselect) {
                            setStateDropdownContent(() {
                              if (values
                                  .map((e) => e.value)
                                  .contains(item.value)) {
                                values.removeWhere(
                                    (element) => element.value == item.value);
                                value = null;
                              } else {
                                values.add(item);
                              }
                            });
                            widget.controller.text =
                                values.map((e) => e.label).join(", ");
                            widget.onChangeSelectedItems?.call(values);
                          } else {
                            widget.controller.text = value?.label ?? "";
                            widget.onChange?.call(item);
                            closeOverlay();
                          }
                        },
                        onSearch: widget.isSearchable ? onSearch : null,
                        items: items,
                        selectedItem: value,
                        selectedItems: values,
                        isMultiselect: widget.isMultiselect,
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void closeOverlay() {
    items = widget.items;
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    _isVisible = false;
  }

  void onSearch(value) {
    items = widget.items
        .where((element) => element.label
            .toLowerCase()
            .contains(value.toString().toLowerCase()))
        .toList();
    _overlayEntry!.markNeedsBuild();
  }

  @override
  void dispose() {
    closeOverlay();
    super.dispose();
  }
}
