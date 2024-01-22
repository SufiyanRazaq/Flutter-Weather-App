import 'package:intl/intl.dart';

class Utilities {
  Map<dynamic, String> imageMap = {
    'Partially cloudy': 'assets/images/nightRain.png',
    'Overcast': 'assets/images/sunSlowRain.png',
    'Clear': 'assets/images/wind.png',
    'null': 'assets/images/nightStatRain.png',
  };

  static String formateDate(DateTime date) {
    String formattedDate = DateFormat('EEEE d MMM').format(date);
    return formattedDate;
  }

  static String extractDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('d').format(dateTime);
    return formattedDate;
  }

  static String extractDay(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('EEEE').format(dateTime);
    String abbreviatedDay = formattedDate.substring(0, 3);
    return abbreviatedDay;
  }

  static String formateTime(String time) {
    DateFormat dateFormat = DateFormat('hh:mm a');
    DateTime dateTime = DateTime.parse('2023-08-08T$time');
    String timeIn12HoursFormat = dateFormat.format(dateTime);
    return timeIn12HoursFormat;
  }

  static String currentTime() {
    DateFormat dateFormat = DateFormat('hh:mm a');
    DateTime now = DateTime.now();
    String time = dateFormat.format(now);
    return time;
  }

  static String formateTimewithoutAmPm(String time) {
    DateFormat dateFormat = DateFormat('hh:mm');
    DateTime dateTime = DateTime.parse('2023-08-08T$time');
    String timeIn24HourFormat = dateFormat.format(dateTime);
    return timeIn24HourFormat;
  }

  static bool checkTime(String time) {
    DateFormat dateFormat = DateFormat('hh a');
    DateTime dateTime = DateTime.parse('2023-08-08T$time');
    DateTime now = DateTime.now();
    return dateFormat.format(dateTime) == dateFormat.format(now);
  }
}
