import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/text.dart';
import '../../core/values/colors.dart';

class AtomMenuItem extends StatelessWidget {
  final String label;

  final int? index;
  final int? selectedIndex;
  final bool isSelected;
  final Rx<bool> isSelectedGroup;
  final List<AtomMenuItem> items;
  final void Function()? onTap;

  AtomMenuItem({
    Key? key,
    required this.label,
    this.items = const [],
    this.onTap,
    this.index,
    this.selectedIndex,
  })  : isSelectedGroup = Rx(items.map((e) => e.index).contains(selectedIndex)),
        isSelected = index == selectedIndex && index != null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        onTap: () {
          onTap?.call();
          if (items.isNotEmpty) {
            isSelectedGroup.value = !isSelectedGroup.value;
          }
        },
        child: Obx(() {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomText.xl(
                      label,
                      color: white,
                    ),
                  ),
                  if (items.isNotEmpty)
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Icon(
                          isSelectedGroup.value
                              ? Icons.keyboard_arrow_up_outlined
                              : Icons.keyboard_arrow_down_outlined,
                        ),
                      );
                    }),
                ],
              ),
              if (isSelectedGroup.value)
                Column(
                  children: items,
                ),
            ],
          );
        }),
      ),
    );
  }
}
