import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/colors.dart';
import '../../data/models/item_select.dart';
import '../atoms/empty_list.dart';
import '../atoms/item_card.dart';
import '../atoms/text_field.dart';

class MoleculeDropdownContent extends StatelessWidget {
  final List<ItemSelect> items;
  final ItemSelect? selectedItem;
  final List<ItemSelect> selectedItems;
  final void Function(ItemSelect) onTap;
  final void Function(String value)? onSearch;
  final bool isMultiselect;

  const MoleculeDropdownContent({
    Key? key,
    required this.items,
    required this.onTap,
    required this.isMultiselect,
    this.onSearch,
    this.selectedItem,
    this.selectedItems = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (onSearch != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: AtomTextField(
              hintText: "search".tr,
              onChanged: onSearch,
              height: 40,
              borderRadius: 30,
              suffix: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: secondColor,
                ),
              ),
            ),
          ),
        items.isEmpty
            ? const AtomEmptyList()
            : Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return AtomItemCard(
                      item: items[index],
                      onTap: onTap,
                      isSelected: (selectedItem?.value == items[index].value &&
                              !isMultiselect) ||
                          selectedItems
                              .map((e) => e.value)
                              .contains(items[index].value),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
