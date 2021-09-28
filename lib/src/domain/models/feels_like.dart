import 'package:equatable/equatable.dart';

class FeelsLike extends Equatable{
   FeelsLike({
    required this.day,
    required this.evening,
    required this.morning,
    required this.night,
  });

    final num morning;
  final num day;
  final num evening;
  final num night;

   @override
  List<Object?> get props => [
        morning,
        day,
        evening,
        night,
     
      ];
}