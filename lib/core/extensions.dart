//* String

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  String get capitalize {
    return substring(0, 1).toUpperCase() + substring(1);
  }

  String get capitalizeFirst {
    if (isEmpty) return "";
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get initials {
    List<String> nameParts = split(' ');
    String initials = '';

    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
      }
    }

    return initials;
  }

  String get emailPrefix {
    List<String> parts = split('@');
    if (parts.length > 1) {
      return parts[0].capitalize;
    }
    // Return the original email if no "@" symbol found
    return capitalize;
  }
}

//* DateTime
extension DateUtil on DateTime {
  String get formatToDate {
    return "$year-$month-$day";
  }

  String get formatToTime {
    String minuteString = minute.toString().padLeft(2, '0');
    return "$hour:$minuteString";
  }

  String get formatToTimePeriod {
    String period = this.hour < 12 ? 'AM' : 'PM';
    int hour = this.hour % 12;
    if (hour == 0) {
      hour = 12;
    }
    String minuteString = minute.toString().padLeft(2, '0');
    return "$hour:$minuteString $period";
  }

  String get formatTimeAgo {
    DateTime now = DateTime.now();
    Duration difference = now.difference(this);

    if (difference.inDays >= 2) {
      return "${difference.inDays}d ago";
    } else if (difference.inDays == 1) {
      return "1d";
    } else if (difference.inHours > 0) {
      return "${difference.inHours}h";
    } else if (difference.inMinutes >= 2) {
      return "${difference.inMinutes}m";
    } else if (difference.inMinutes == 1) {
      return "1m";
    } else {
      return "Just now";
    }
  }
}

//* File Picker

extension FilePickerExtension on FilePickerResult {
  // Extension method to get the picked file as a platform-specific File
  Future<File?> get asFile async {
    if (files.isNotEmpty) {
      final filePath = files.single.path;
      if (filePath != null) {
        return File(filePath);
      }
    }
    return null;
  }
}

//* Media Query
//? Not sure how this is applied yet. Check gabby's github for impl

extension BuildContextExtension on BuildContext {
  Size get getSize => MediaQuery.of(this).size;
  Size get getSizeOf => MediaQuery.sizeOf(this);
}

extension WidgetExtension on num {
  SizedBox get sbW => SizedBox(width: toDouble());
  SizedBox get sbH => SizedBox(height: toDouble());
}

// extension ScaffoldExt on Widget{
//     ScaffoldMessenger get snackBar => ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: this),
//       );
// }
