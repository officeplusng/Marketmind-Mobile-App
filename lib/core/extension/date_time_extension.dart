import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatTimestamp() {
    final timestamp = this;
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} mins ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hrs ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    }
  }
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min${difference.inMinutes > 1 ? 's' : ''} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hr${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    }
  }

  String beautify({bool withDate = true}) {
    final result = DateFormat(
      'hh:mm a',
    ).format(
      this,
    );
    final split = result.split(':');
    final numericalValue = int.parse(split[0]);
    String meridian = 'am';
    if (numericalValue >= 12) {
      meridian = 'pm';
    }
    final date = formatDate();
    return '${withDate ? '$date\n' : ''}$result';
  }

  String meridianString() {
    final result = DateFormat(
      'hh:mm a',
    ).format(
      this,
    );
    final meridian = result.split(' ').lastOrNull?.toLowerCase() ?? 'am';
    final split = result.split(':');
    final numericalValue = int.parse(split[0]);
    if (meridian == 'am') {
      return 'morning';
    }

    if (numericalValue >= 4) {
      return 'evening';
    }
    if (numericalValue <= 12) {
      return 'afternoon';
    }
    return 'morning';
  }

  String toDateString() {
    final result = toIso8601String().split('T');
    if (result.isEmpty) {
      return '';
    }
    return result[0];
  }

  String formatDate() {
    return DateFormat('MMM d, y').format(this);
  }

  String formatDate1({String? format}) {
    return DateFormat(format ?? 'MMM d y').format(this);
  }
}


String cleanDate(String input) {
  try {
    final value = input.split('T')[0];
    return (DateTime.tryParse(value) ?? DateTime.now()).formatDate();
  } catch (e) {
    return '';
  }
}
