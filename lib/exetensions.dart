extension DateTimeEx on DateTime {
  String get format =>
      '${this.hour}: ${this.minute} ${this.timeZoneName},${this.day}/${this.month}/${this.year}';
}
