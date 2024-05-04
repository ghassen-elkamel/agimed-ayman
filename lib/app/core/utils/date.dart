import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'language_helper.dart';

class UtilsDate {
  static String formatDDMMYYYY(DateTime? date) {
    if (date == null) {
      return "";
    }
    final f = DateFormat('dd/MM/yyyy');
    return f.format(date);
  }

  static String formatDDMMYYYYHHmm(DateTime? date) {
    if (date == null) {
      return "";
    }
    final f = DateFormat('dd/MM/yyyy HH:mm');
    return f.format(date);
  }

  static String formatHHmmDDMMYYYY(DateTime? date) {
    if (date == null) {
      return "";
    }
    final f = DateFormat('HH:mm dd/MM/yyyy');
    return f.format(date);
  }

  static String formatEEEED(DateTime? date) {
    if (date == null) {
      return "";
    }
    final f = DateFormat('EEEE d');
    return f.format(date);
  }

  static String formatHHmm(DateTime? date) {
    if (date == null) {
      return "";
    }
    final f = DateFormat('HH:mm');
    return f.format(date);
  }

  static String? formatYYYYMMDD(DateTime? date) {
    if (date == null) {
      return null;
    }
    final f = DateFormat('yyyy-MM-dd');
    return f.format(date);
  }

  static String formatMMMM(DateTime? date) {
    if (date == null) {
      return "";
    }
    final f = DateFormat('MMMM', LanguageHelper.language);
    return f.format(date);
  }

  static String formatDuration(Duration duration) {
    return "${"${duration.inMinutes}".padLeft(2, "0")}:${"${duration.inSeconds.remainder(60)}".padLeft(2, "0")}";
  }

  static Future<DateTime?> getDate(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );
  }
}
