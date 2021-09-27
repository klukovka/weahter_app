import 'package:equatable/equatable.dart';

class FeelsLike extends Equatable{
   FeelsLike({
    required this.day,
    required this.evening,
    required this.morning,
    required this.night,
  });

    final double morning;
  final double day;
  final double evening;
  final double night;

   @override
  List<Object?> get props => [
        morning,
        day,
        evening,
        night,
     
      ];
}