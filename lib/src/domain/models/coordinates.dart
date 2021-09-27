import 'package:equatable/equatable.dart';

class Coordinates extends Equatable {
  Coordinates(this.latitude, this.longitude);
  final double latitude;
  final double longitude;
  @override
  List<Object?> get props => [latitude,longitude];
}
