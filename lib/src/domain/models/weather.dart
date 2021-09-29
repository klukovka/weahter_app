import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.description,
    required this.icon,
    required this.id,
    required this.main,
  });
  final int id;
  final String main;
  final String description;
  final String icon;

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}
