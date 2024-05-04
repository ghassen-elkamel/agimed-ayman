import 'package:flutter/material.dart';

class AtomListViewBuilder<T> extends StatelessWidget {
  const AtomListViewBuilder(
      {Key? key,
      required this.items,
      this.shrinkWrap = true,
      this.scrollPhysics = const ClampingScrollPhysics(),
      required this.itemBuilder,
      this.scrollDirection = Axis.vertical,
      this.reverse = false})
      : super(key: key);
  final bool reverse;
  final List<T> items;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollPhysics scrollPhysics;

  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: reverse,
      itemCount: items.length,
      shrinkWrap: shrinkWrap,
      physics: scrollPhysics,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        T item = items[index];
        return itemBuilder(context, index, item);
      },
    );
  }
}
