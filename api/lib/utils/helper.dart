import 'package:intl/intl.dart';

int convertToInt(dynamic value) {
  int number;
  if (value is String) {
    number = int.tryParse(value);
  } else if (value is double) {
    number = value.toInt();
  } else if (value is int) {
    number = value;
  }

  return number;
}

double convertToDouble(dynamic value) {
  double number;
  if (value is String) {
    number = double.tryParse(value);
  } else if (value is int) {
    number = value.toDouble();
  } else if (value is double) {
    number = value;
  }

  return number;
}

String getSqlDate(dynamic input, {bool hour = false}) {
  try {
    if (input is DateTime) {
      DateFormat sqlFormat =
          DateFormat('yyyy-MM-dd' + (hour ? ' HH:mm:ss' : ''));

      return sqlFormat.format(input);
    } else if (input is String) {
      return getSqlDate(DateFormat().parse(input), hour: hour);
    }
  } catch (e) {
    print(e);
  }

  return null;
}

String getFormatedDateHour(dynamic input) {
  try {
    return '${getFormatedDate(input)} ${getFormatedHour(input)}';
  } catch (_) {}

  return null;
}

String getFormatedDate(dynamic input, {DateFormat format}) {
  try {
    DateTime dateTime;
    if (input is DateTime) {
      dateTime = input;
    } else if (input is String) {
      dateTime = getDateTime(input);
    }

    return (format ?? DateFormat.yMd()).format(dateTime);
  } catch (_) {}

  return null;
}

String getFormatedHour(dynamic input) {
  try {
    DateTime dateTime;
    if (input is DateTime) {
      dateTime = input;
    } else if (input is String) {
      dateTime = getDateTime(input);
    }

    return DateFormat.jm().format(dateTime);
  } catch (_) {}

  return null;
}

DateTime getDateTime(String input, {String pattern = 'yyyy-MM-dd HH:mm:ss'}) {
  try {
    return DateFormat(pattern).parse(input);
  } catch (_) {}

  return null;
}
