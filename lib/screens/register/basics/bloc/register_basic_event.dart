import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterBasicEvent extends Equatable {
  const RegisterBasicEvent();

  @override
  List<Object> get props => [];
}

class BankNameChanged extends RegisterBasicEvent {
  final String bankName;

  const BankNameChanged({@required this.bankName});

  @override
  List<Object> get props => [bankName];

  @override
  String toString() => 'BankNameChanged { bankname: $bankName }';
}

class AccountNameChanged extends RegisterBasicEvent {
  final String accountName;

  const AccountNameChanged({@required this.accountName});

  @override
  List<Object> get props => [accountName];

  @override
  String toString() => 'AccountNameChanged { accountname: $accountName }';
}


class Submitted extends RegisterBasicEvent {
  final String bankName;
  final String accountName;

  const Submitted({
    @required this.bankName,
    @required this.accountName,
  });

  @override
  List<Object> get props => [bankName, accountName];

  @override
  String toString() {
    return 'Submitted { irstname: $bankName, lastname: $accountName}';
  }
}
