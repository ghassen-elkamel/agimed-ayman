import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/extensions/double/currency_format.dart';
import '../../core/extensions/string/not_null_and_not_empty.dart';
import '../../core/theme/text.dart';
import '../../core/utils/date.dart';
import '../../core/values/colors.dart';
import '../../core/values/size.dart';
import '../atoms/card.dart';

class MoleculeCardDetails extends StatelessWidget {
  final String? location;
  final DateTime? date;
  final DateTime? startDate;
  final DateTime? endDate;
  final int capacity;
  final int? guestsNumber;
  final bool toRegister;
  final int registrationTotal;
  final String? title;
  final String? subtitle;
  final double? price;
  final String? note;
  final DateTime? deadline;
  final bool withSubscribers;

  const MoleculeCardDetails({
    Key? key,
    this.location,
    this.date,
    this.endDate,
    this.startDate,
    required this.toRegister,
    this.capacity = 0,
    this.registrationTotal = 0,
    this.title,
    this.subtitle,
    this.price,
    this.note,
    this.deadline,
    this.guestsNumber,
    this.withSubscribers = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AtomCard(
      color: secondColor,
      margin: 16,
      padding: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (endDate == null)
                Expanded(
                  child: CustomText.m(
                    "${location ?? ''} ${'on'.tr} ${UtilsDate.formatDDMMYYYY(date)} ${UtilsDate.formatDDMMYYYYHHmm(startDate)} ",
                    textAlign: TextAlign.left,
                  ),
                ),
              const SizedBox(width: 16),
              CustomText.xl(
                "$registrationTotal/$capacity",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: CustomText.showAll(
              title,
            ),
          ),
          if (endDate != null)
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: CustomText.m(
                "${"period".tr}: ${UtilsDate.formatDDMMYYYY(date)} ${UtilsDate.formatHHmm(startDate)} - ${UtilsDate.formatDDMMYYYYHHmm(endDate)}",
              ),
            ),
          if (location.isFilled)
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: CustomText.m(
                "${"place".tr}: $location",
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomText.showAll(
              subtitle,
              fontSize: mSize,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: CustomText.showAll(
                  price.toCurrency,
                  fontSize: xxlSize,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(
            height: 1,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          if (note.isFilled)
            CustomText.showAll(
              "${'nb'.tr}: $note",
              fontSize: mSize,
              color: Colors.white,
            ),
          if (deadline != null)
            CustomText.showAll(
              "${'lastDateToRegister'.tr}: ${UtilsDate.formatDDMMYYYY(deadline)}",
              fontSize: mSize,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  String getDayOfWeek(int index) {
    switch (index) {
      case 0:
        return "sunday".tr;
      case 1:
        return "monday".tr;
      case 2:
        return "tuesday".tr;
      case 3:
        return "wednesday".tr;
      case 4:
        return "thursday".tr;
      case 5:
        return "friday".tr;
      case 6:
        return "saturday".tr;
      default:
        return "Invalid index";
    }
  }
}
