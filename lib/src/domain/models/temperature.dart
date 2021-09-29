import 'package:equatable/equatable.dart';

class Temperature extends Equatable {
  const Temperature({
    required this.day,
    required this.evening,
    required this.max,
    required this.min,
    required this.morning,
    required this.night,
  });
  final num morning;
  final num day;
  final num evening;
  final num night;
  final num max;
  final num min;

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
