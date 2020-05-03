import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterAddressEvent extends Equatable {
  const RegisterAddressEvent();

  @override
  List<Object> get props => [];
}

class StreetAddressChanged extends RegisterAddressEvent {
  final String streetAddress;

  const StreetAddressChanged({@required this.streetAddress});

  @override
  List<Object> get props => [streetAddress];

  @override
  String toString() => 'StreetAddressChanged { streetAddress: $streetAddress }';
}

class CityChanged extends RegisterAddressEvent {
  final String city;

  const CityChanged({@required this.city});

  @override
  List<Object> get props => [city];

  @override
  String toString() => 'CityChanged { city: $city }';
}

class StateChanged extends RegisterAddressEvent {
  final String state;

  const StateChanged({@required this.state});

  @override
  List<Object> get props => [state];

  @override
  String toString() => 'StateChanged { state: $state }';
}

class Submitted extends RegisterAddressEvent {
  final String streetAddress;
  final String city;
  final String state;

  const Submitted(
      {@required this.streetAddress,
      @required this.city,
      @required this.state});

  @override
  List<Object> get props => [streetAddress, city, state];

  @override
  String toString() {
    return 'Submitted { streetAddress: $streetAddress, city: $city, state: $state}';
  }
}
