import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/utils/alert.dart';

class FileInfo {
  List<int> bytes;
  String fileName;
  String? path;
  int length;

  FileInfo({
    required this.fileName,
    required this.path,
    required this.length,
    required this.bytes,
  });

  List<XFile> getXFiles() {
    List<XFile> files = [];
    if (bytes.isNotEmpty && fileName.isNotEmpty) {
      XFile imageFile = XFile.fromData(
        Uint8List.fromList(bytes),
        mimeType: fileName,
      );
      files.add(imageFile);
    }
    return files;
  }

  share({String? text, void Function()? onFinish}) {
    Alert.verifyRequest(
      action: "toShare".tr,
      onConfirm: () async {
        Get.back();
        await Share.shareXFiles(getXFiles(), subject: "share".tr, text: text);
        onFinish?.call();
      },
      onCancel: onFinish,
    );
  }
}
