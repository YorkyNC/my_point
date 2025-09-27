extension DurationExtension on Duration {
  String get formatMinSecMilli {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    String twoDigitMilli = twoDigits(inMilliseconds.remainder(1000)~/10);
    return "$twoDigitMinutes:$twoDigitSeconds.$twoDigitMilli";
  }
}