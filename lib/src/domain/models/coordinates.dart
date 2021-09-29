import 'package:equatable/equatable.dart';

class Coordinates extends Equatable {
  const Coordinates(this.latitude, this.longitude);
  final num latitude;
  final num longitude;
  @override
  List<Object?> get props => [latitude,longitude];
}
