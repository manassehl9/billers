import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterNameEvent extends Equatable {
  const RegisterNameEvent();

  @override
  List<Object> get props => [];
}

class FirstNameChanged extends RegisterNameEvent {
  final String firstName;

  const FirstNameChanged({@required this.firstName});

  @override
  List<Object> get props => [firstName];

  @override
  String toString() => 'FirstNameChanged { firstname: $firstName }';
}

class LastNameChanged extends RegisterNameEvent {
  final String lastName;

  const LastNameChanged({@required this.lastName});

  @override
  List<Object> get props => [lastName];

  @override
  String toString() => 'LastNameChanged { lastname: $lastName }';
}




