import 'dart:io';
import 'dart:typed_data';

import 'package:agimed/app/data/providers/external/src/api_provider_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../app/core/utils/alert.dart';
import '../../data/providers/external/api_provider.dart';
import '../values/colors.dart';


class DownloadFileHelper {
  static DownloadFileHelper? _instance;

  factory DownloadFileHelper() {
    _instance ??= DownloadFileHelper._internal();
    return _instance!;
  }

  DownloadFileHelper._internal();

  Future<void> saveBytesToDownloadDirectory(
    Uint8List bytes,
    String fileRemotePath,
  ) async {
    try {
      await Permission.storage.request();
      String filePath = await _prepareSaveDir();
      String fileName = fileRemotePath.split('/').last;
      filePath = '$filePath/${DateTime.now().millisecondsSinceEpoch}_$fileName';
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      Alert.showCustomSnackBar(
        title: "fileDownloaded".tr,
        message: "open".tr,
        duration: 10,
        onTapMessage: () async {
          await Permission.photos.request();
          Get.closeCurrentSnackbar();
          await OpenFile.open(filePath);
        },
        icon: const Icon(
          Icons.file_download,
          color: blackLight,
        ),
      );
    } catch (e) {
      Alert.showCustomSnackBar(
        title: "error".tr,
        message: "weCantDownloadThisFile".tr,
      );
    }
  }

  Future<void> remote(
    String url,
  ) async {
    var response = await http.get(Uri.parse(url),
        headers: ApiProvider().getImageHeaders());
    return await saveBytesToDownloadDirectory(response.bodyBytes, url);
  }

  Future<String> _prepareSaveDir() async {
    String? localPath = await findLocalPath;
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create(recursive: true);
    }

    return localPath;
  }

  Future<String> get findLocalPath async {
    if (Platform.isAndroid) {
      return "/storage/emulated/0/Download";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Download';
    }
  }
}
