import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterProfileEvent extends Equatable {
  const RegisterProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileEmailChanged extends RegisterProfileEvent {
  final String email;

  const ProfileEmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class ProfilePasswordChanged extends RegisterProfileEvent {
  final String password;

  const ProfilePasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class ProfileSubmitted extends RegisterProfileEvent {
  final String email;
  final String password;
  // final String firstName;

  const ProfileSubmitted({
    @required this.email,
    @required this.password,
    // @required this.firstName
  });

  @override
  List<Object> get props => [email, password,];

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password,}';
  }
}
