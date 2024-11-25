import 'package:intl/intl.dart';

import 'constants.dart';

extension StatusEx on Status {
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
  bool get isLoading => this == Status.loading;
  bool get isInitial => this == Status.initial;
}

extension StringEx on String {
  bool get isSuccess => this == "SUCCESS";
  bool get isError => this == "ERROR";
}

extension DateTimeEx on DateTime {
  String get formattedDate => DateFormat('yyyy-MM-dd').format(this);
}
