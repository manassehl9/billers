import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterBasicEvent extends Equatable {
  const RegisterBasicEvent();

  @override
  List<Object> get props => [];
}

class DateOfBirthChanged extends RegisterBasicEvent {
  final String dateOfBirth;

  const DateOfBirthChanged({@required this.dateOfBirth});

  @override
  List<Object> get props => [dateOfBirth];

  @override
  String toString() => 'DateOfBirthChanged { dateOfBirth: $dateOfBirth }';
}

class GenderChanged extends RegisterBasicEvent {
  final String gender;

  const GenderChanged({@required this.gender});

  @override
  List<Object> get props => [gender];

  @override
  String toString() => 'GenderChanged { gender: $gender }';
}

class Submitted extends RegisterBasicEvent {
  final String dateOfBirth;
  final String gender;

  const Submitted({
    @required this.dateOfBirth,
    @required this.gender,
  });

  @override
  List<Object> get props => [dateOfBirth, gender];

  @override
  String toString() {
    return 'Submitted { dateOfBirth: $dateOfBirth, gender: $gender}';
  }
}
