import 'package:equatable/equatable.dart';

class Temperature extends Equatable {
  Temperature({
    required this.day,
    required this.evening,
    required this.max,
    required this.min,
    required this.morning,
    required this.night,
  });
  final double morning;
  final double day;
  final double evening;
  final double night;
  final double max;
  final double min;

  @override
  List<Object?> get props => [
        morning,
        day,
        evening,
        night,
        max,
        min,
      ];
}
