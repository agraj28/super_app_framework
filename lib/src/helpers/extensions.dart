import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:rxdart/rxdart.dart';

extension IterableX on Iterable? {
  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else {
      return this!.isEmpty;
    }
  }

  bool containsOrFalse(element) {
    if (this == null) {
      return false;
    }

    return this!.contains(element);
  }

  bool containsOrTrue(element) {
    if (this == null) {
      return true;
    }

    return this!.contains(element);
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension MapX<K, V> on Map<K, V> {
  T? get<T>(K key) => this[key] as T?;

  String jsonEncode() => json.encode(this);
}

extension ChangeNotifierX on ChangeNotifier {
  Stream<T> asStream<T extends ChangeNotifier>() {
    final _stream = BehaviorSubject<T>();
    addListener(() => _stream.add(this as T));
    return _stream;
  }
}

extension StringX on String {
  bool containsIgnoreCase(String stringToMatch) {
    return toLowerCase().contains(stringToMatch.toLowerCase());
  }

  bool hasValidData() {
    return trim().isNotEmpty;
  }


  String getSafeData() {
    return hasValidData() ? this : '';
  }

  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else if (this is String && this == 'null') {
      return true;
    } else {
      return isEmpty;
    }
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  Iterable<String> toIterable() sync* {
    for (var i = 0; i < length; i++) {
      yield (this[i]);
    }
  }

  /// Same as contains, but allows for case insensitive searching
  ///
  /// [caseInsensitive] defaults to false
  bool containsX(String string, {bool caseInsensitive = false}) {
    if (caseInsensitive) {
      // match even if case doesn't match
      return toLowerCase().contains(string.toLowerCase());
    } else {
      return contains(string);
    }
  }

  String? extractSubstring(Pattern pattern) {
    final match = RegExp(pattern as String).firstMatch(this)!;
    if (match.groupCount > 0) {
      return match.group(1);
    }
    return '';
  }

  String substringUntil(Pattern occurrence) {
    final index = indexOf(occurrence);
    if (index == -1) {
      return this;
    }
    return substring(0, index);
  }

  String toLowerCaseNoSpaces() => toLowerCase().replaceAll(' ', '');
  String toLowerCaseNoSpecialCharacters() => toLowerCase()
      .replaceAll(' ', '')
      .replaceAll(RegExp(r'(?:_|[^\w\s])+'), '');
}

extension ListEmptyValidation<E> on Iterable<E>? {
  bool hasData() => this != null && this!.isNotEmpty;
}

extension EmptyAndNullStringValidation on String? {
  bool isNotNullAndNotEmpty() {
    return !(['', null].contains(this));
  }

  bool get isNotNullOrEmpty => !(['', null].contains(this));

  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else if (this is String && this == 'null') {
      return true;
    } else {
      return this!.isEmpty;
    }
  }

  bool containsIgnoreCase(String stringToMatch) {
    if (this == null) {
      return false;
    }
    return this!.toLowerCase().contains(stringToMatch.toLowerCase());
  }
}


extension NullValidation on dynamic {
  bool isNotNull() {
    return this != null;
  }
}

extension FileSizeDoubleUtils on double {
  String getFileSizeInMB({int precisionCount = 2}) {
    return (this / (1024 * 1024)).toStringAsFixed(precisionCount);
  }

  String getFileSizeInMBWithTag({int precisionCount = 2}) {
    return '${FileSizeDoubleUtils(this).getFileSizeInMB()} MB';
  }
}

extension FileSizeIntUtils on int {
  String getFileSizeInMB({int precisionCount = 2}) {
    return (this / (1024 * 1024)).toStringAsFixed(precisionCount);
  }

  String getFileSizeInMBWithTag({int precisionCount = 2}) {
    return '${FileSizeIntUtils(this).getFileSizeInMB()} MB';
  }
}

extension FileConversionUtils on File {
  Future<List<int>> getBytesData() async {
    List<int> fileBytes = await this.readAsBytes();
    return fileBytes;
  }

  Future<String> getBase64Data() async {
    List<int> imageBytes = await this.readAsBytes();
    return base64.encode(imageBytes);
  }

  Future<String> getBinaryData(Uint8List bytes) async {
    var binaryList = <String>[];
    for (int i = 0; i < bytes.length; i++) {
      int byteValue = bytes[i];
      String binaryFormatedData =
          await BinaryConversionUtils(byteValue).getBinary();
      binaryList.add(binaryFormatedData);
    }
    String fileInBinaryData = binaryList.join();
    return fileInBinaryData;
  }
}

extension BinaryConversionUtils on int {
  Future<String> getBinary() async {
    List<int> output = <int>[];
    int input = this;
    if ((input % 128).floor() == 1) {
      output.add(1);
      input = input - 128;
    } else {
      output.add(0);
    }

    if ((input % 64).floor() == 1) {
      output.add(1);
      input = input - 64;
    } else {
      output.add(0);
    }

    if ((input % 32).floor() == 1) {
      output.add(1);
      input = input - 32;
    } else {
      output.add(0);
    }

    if ((input % 16).floor() == 1) {
      output.add(1);
      input = input - 16;
    } else {
      output.add(0);
    }

    if ((input % 8).floor() == 1) {
      output.add(1);
      input = input - 8;
    } else {
      output.add(0);
    }

    if ((input % 4).floor() == 1) {
      output.add(1);
      input = input - 4;
    } else {
      output.add(0);
    }

    if ((input % 2).floor() == 1) {
      output.add(1);
      input = input - 2;
    } else {
      output.add(0);
    }

    if ((input % 1).floor() == 1) {
      output.add(1);
      input = input - 1;
    } else {
      output.add(0);
    }

    String binaryFormatedData = output.join();
    return binaryFormatedData;
  }
}

extension FileNameUtils on File {
  Future<String> getFileName() async {
    return await path.basename(this.path);
  }
}

extension SwapList on List<dynamic> {
  List<T?> swap<T>(int index1, int index2) {
    T? temp = this[index1];
    this[index1] = this[index2];
    this[index2] = temp;
    return this as List<T?>;
  }
}

/// Date Time Util
extension DateUtil on String {
  DateTime convertDate() {
    return DateTime.parse(this);
  }

  DateTime? tryConvertDate() {
    return DateTime.tryParse(this);
  }
}

extension StringToTimeUtil on String {
  String formatDate(String format) {
    final formatter = DateFormat(format);
    try {
      return formatter.format(DateTime.parse(this).toLocal());
    } on FormatException {
      try {
        var inputDateFormat = 'E, d MMM yyyy HH:mm:ss Z';
        var inputDate = DateFormat(inputDateFormat).parse(this);
        return formatter.format(inputDate);
      } on Exception {
        return formatter
            .format(DateTime.parse(DateTime.now().toString()).toLocal());
      }
    } on Exception {
      return '';
    }
  }
}

extension IntUtils on int {
  bool hasValidData() {
    return (this != null);
  }
}



/// 0:- Today
/// 1:- Yesterday
extension DayAgo on String? {
  int get dayAgo {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    DateTime dateToCheck = DateUtil(this!).convertDate().toUtc().toLocal();

    final aDate =
        DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);

    if (today == aDate) {
      return 0;
    } else if (yesterday == aDate) {
      return -1;
    }
    return -1;
  }
}

extension DayWithTime on String? {
  String get dayWithTime {
    final dayAgo = DayAgo(this).dayAgo;
    var time = StringToTimeUtil(this!).formatDate('hh:mm a');
    if (time[0] == '0') {
      time = time.substring(1, time.length);
    }
    if (![0, 1].contains(dayAgo)) {
      var day = StringToTimeUtil(this!).formatDate('d MMM yyyy');
      time = '$day';
    }

    return time;
  }

  String get getFormattedTime {
    final dayAgo = DayAgo(this).dayAgo;
    var time = StringToTimeUtil(this!).formatDate('hh:mm a');
    if (time[0] == '0') {
      time = time.substring(1, time.length);
    }
    return time;
  }
}

extension DateTimeX on DateTime {
  /// returns dates with the following formatting:
  /// 2020-05-18
  String toAccorDateTimeString() => '$year-$month-$day';

  DateTime floor() => DateTime(year, month, day);

  DateTime next(int day) {
    return add(
      Duration(
        days: (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }

  bool isAtLeastADayAfter(DateTime dateTime) {
    print(difference(dateTime).inHours);
    if (difference(dateTime).inHours >= 24) {
      return true;
    } else {
      return false;
    }
  }

  DateTime operator +(Duration duration) => add(duration);

  bool floorIsBefore(DateTime a) {
    return floor().isBefore(a.floor());
  }

  bool floorIsAfter(DateTime a) {
    return floor().isAfter(a.floor());
  }

  bool floorSameOrAfter(DateTime a) {
    return floor().isAfter(a.floor()) || isSameDate(a);
  }

  bool floorSameOrBefore(DateTime a) {
    return floor().isBefore(a.floor()) || isSameDate(a);
  }

  bool floorIsBeforeNow() {
    return floorIsBefore(DateTime.now().floor());
  }

  bool compareWithoutTime(DateTime b) {
    return day == b.day && month == b.month && year == b.year;
  }

  // Return true if date is in this range.
  bool compareDateRange(DateTime start, DateTime? end) {
    return compareTo(start) >= 0 && compareTo(end!) <= 0;
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}


extension DurationExtensions on Duration {
  /// Converts the duration into a readable string
  String toHoursMinutes() {
    num minutes = inMinutes.remainder(60);
    final hours = inHours;
    var text = '';
    if (hours > 0) {
      text = '${hours}h';
    }

    if (minutes > 0) {
      text = text.isEmpty ? '${minutes}m' : '$text${' ${minutes}m'}';
    }
    return text;
  }

//  /// Converts the duration into a readable string
//  /// 05:15:35
//  String toHoursMinutesSeconds() {
//    var twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
//    var twoDigitSeconds = _toTwoDigits(inSeconds.remainder(60));
//    return '${_toTwoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds';
//  }
//
//  int _toTwoDigits(int n) {
//    if (n >= 10) return n;
//  }
}

extension NumX on num {
  bool isWithin(num low, num high, {bool inclusive = true}) {
    if (inclusive) {
      return this >= low && this <= high;
    } else {
      return this > low && this < high;
    }
  }
}

extension ListX<E> on List<E?> {
  bool equals(List other) {
    return listEquals<E?>(this, other as List<E?>?);
  }

  bool containsWhere(bool test(E? element)) {
    for (final e in this) {
      if (test(e)) return true;
    }
    return false;
  }

  E? firstOrElse(E Function() orElse) {
    if (isNotEmpty) {
      return first;
    } else {
      return orElse();
    }
  }
}
