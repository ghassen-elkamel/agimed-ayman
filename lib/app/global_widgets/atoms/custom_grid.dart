import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/global_widgets/atoms/button.dart';
import 'empty_list.dart';

class AtomCustomGrid<T> extends StatelessWidget {
  final int crossAxisCount;
  final List<T>? items;
  final void Function()? loadMore;
  final Widget Function(
    BuildContext ctx,
    T item,
  ) itemBuilder;

  const AtomCustomGrid({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.loadMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items?.isEmpty ?? true) {
      return const AtomEmptyList();
    }
    int ceil = (items!.length / crossAxisCount).ceil();
    return ListView.builder(
      itemCount: ceil,
      itemBuilder: (ctx, i) {
        int index = i * crossAxisCount;
        Row row = Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < crossAxisCount; i++)
              Expanded(
                child: index + i < items!.length
                    ? itemBuilder(context, items![index + i])
                    : const SizedBox(),
              ),
          ],
        );
        if (i == ceil - 1 && loadMore != null) {
          return Column(
            children: [
              row,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AtomButton(
                  label: "loadMore".tr,
                  onPressed: loadMore,
                ),
              ),
            ],
          );
        }
        return row;
      },
    );
  }
}
