import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/enums/button_type.dart';
import '../../global_widgets/atoms/alert_dialog.dart';
import '../../global_widgets/atoms/button.dart';
import '../theme/text.dart';
import '../values/colors.dart';

class Alert {
  static void showCustomDialog({
    IconData? icon,
    String? image,
    String? title,
    TextStyle? titleStyle,
    String? subTitle,
    TextAlign? subTitleAlign,
    Widget? content,
    List<Widget> actions = const [],
    Function()? onClose,
  }) {
    if (Get.context != null) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AtomAlertDialog(
            icon: icon,
            image: image,
            title: title,
            titleStyle: titleStyle,
            subTitle: subTitle,
            content: content,
            actions: actions,
            onClose: onClose,
            subTitleAlign: subTitleAlign,
          );
        },
      );
    }
  }

  static void showCustomSnackBar({
    required String title,
    required String message,
    void Function()? onTapMessage,
    Widget? icon,
    int duration = 2,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        titleText: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: InkWell(
                onTap: () => Get.closeCurrentSnackbar(),
                child: const Icon(
                  Icons.close,
                  color: blackLight,
                ),
              ),
            ),
            CustomText.l(
              title.tr,
            ),
          ],
        ),
        messageText: InkWell(
          onTap: onTapMessage,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText.m(
              message.tr,
              color: onTapMessage != null ? darkBlue : black,
            ),
          ),
        ),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 85,
        ),
        padding: const EdgeInsets.only(
          top: 13,
          bottom: 16,
          left: 20.55,
          right: 13,
        ),
        backgroundColor: white,
        duration: Duration(seconds: duration),
        borderRadius: 10,
        icon: icon,
        boxShadows: const [BoxShadow(color: white15, blurRadius: 1)],
      ),
    );
  }

  static void showErrors(Map<String, dynamic> data) {
    showCustomDialog(
      title: data["message"] ?? "",
      subTitle: data["errors"] ?? "",
      subTitleAlign: TextAlign.start,
    );
  }

  static void verifyRequest(
      {required String action,
      required void Function() onConfirm,
      void Function()? onCancel}) {
    showCustomDialog(
      title: "${"doYouWantTo".tr} $action ${'interrogationMark'.tr}",
      subTitleAlign: TextAlign.start,
      actions: [
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: AtomButton(
                label: "cancel".tr,
                buttonColor: ButtonColor.white,
                onPressed: () {
                  Get.back();
                  onCancel?.call();
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AtomButton(
                label: "confirm".tr,
                onPressed: onConfirm,
              ),
            ),
          ],
        )
      ],
    );
  }
}
