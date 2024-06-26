import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/text_theme.dart';
import '../../core/values/colors.dart';

class AtomAlertDialog extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String? title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextAlign? subTitleAlign;
  final Widget? content;
  final Function()? onClose;
  final List<Widget> actions;
  final bool withCloseBtn;

  const AtomAlertDialog(
      {Key? key,
      this.icon,
      this.image,
      this.title,
      this.titleStyle,
      this.subTitle,
      this.subTitleAlign,
      this.content,
      this.actions = const [],
      this.onClose,
      this.withCloseBtn = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (withCloseBtn)
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 6,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Get.back();
                      if (onClose != null) {
                        onClose!.call();
                      }
                    },
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(7),
                    color: white,
                    child: const Icon(
                      Icons.clear,
                      size: 25,
                    ),
                  ),
                ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (title != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  title!,
                                  style: titleStyle ?? styleW500Size18,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            if (icon != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Icon(
                                  icon,
                                ),
                              ),
                            if (image != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Image.asset(
                                  "assets/$image",
                                  height: 80,
                                ),
                              ),
                            if (subTitle != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 2),
                                child: Text(
                                  subTitle!,
                                  style: styleBlackLightFontRobotoW400Size16,
                                  textAlign: subTitleAlign ?? TextAlign.center,
                                ),
                              ),
                            if (content != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 2),
                                child: content,
                              ),
                            ...actions
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
