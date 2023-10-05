extension ExtensionOnDateTime on DateTime {
  String get toFormattedDate =>
      "$year-${month.toString().padLeft(2, "0")}-${day.toString().padLeft(2, "0")}";

  int get toUnixFormat => int.parse(
        DateTime.now().millisecondsSinceEpoch.toString().substring(0, 10),
      );

  String get timeAgo {
    DateTime currentDate = DateTime.now();

    var different = currentDate.difference(this);

    if (different.inDays > 365) {
      return "${(different.inDays / 365).floor()} ${(different.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (different.inDays > 30) {
      return "${(different.inDays / 30).floor()} ${(different.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (different.inDays > 7) {
      return "${(different.inDays / 7).floor()} ${(different.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (different.inDays > 0) {
      return "${different.inDays} ${different.inDays == 1 ? "day" : "days"} ago";
    }
    if (different.inHours > 0) {
      return "${different.inHours} ${different.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (different.inMinutes > 0) {
      return "${different.inMinutes} ${different.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    if (different.inMinutes == 0) return 'Just Now';

    return '';
  }

  bool isSameDate(DateTime? other) {
    if (other == null) {
      return false;
    }
    return year == other.year && month == other.month && day == other.day;
  }
}
