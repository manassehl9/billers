import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterPinEvent extends Equatable {
  const RegisterPinEvent();

  @override
  List<Object> get props => [];
}

class PinChanged extends RegisterPinEvent {
  final String pin;

  const PinChanged({@required this.pin});

  @override
  List<Object> get props => [pin];

  @override
  String toString() => 'PinChanged { pin: $pin }';
}

