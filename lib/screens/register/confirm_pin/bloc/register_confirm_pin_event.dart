import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterConfirmPinEvent extends Equatable {
  const RegisterConfirmPinEvent();

  @override
  List<Object> get props => [];
}

class ConfirmPinChanged extends RegisterConfirmPinEvent {
  final String pin;

  const ConfirmPinChanged({@required this.pin});

  @override
  List<Object> get props => [pin];

  @override
  String toString() => 'ConfirmPinChanged { pin: $pin }';
}
