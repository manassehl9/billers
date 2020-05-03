import 'package:meta/meta.dart';

@immutable
class RegisterAddressState {
  final bool isStreetAddressValid;
  final bool isCityValid;
  final bool isStateValid;

  bool get isFormValid => isStreetAddressValid && isCityValid && isStateValid;

  RegisterAddressState(
      {@required this.isStreetAddressValid,
      @required this.isCityValid,
      @required this.isStateValid});

  factory RegisterAddressState.empty() {
    return RegisterAddressState(
      isStreetAddressValid: true,
      isCityValid: true,
      isStateValid: true,
    );
  }

  factory RegisterAddressState.loading() {
    return RegisterAddressState(
      isStreetAddressValid: true,
      isCityValid: true,
      isStateValid: true,
    );
  }

  factory RegisterAddressState.failure() {
    return RegisterAddressState(
      isStreetAddressValid: true,
      isCityValid: true,
      isStateValid: true,
    );
  }

  factory RegisterAddressState.success() {
    return RegisterAddressState(
        isStreetAddressValid: true, isCityValid: true, isStateValid: true);
  }

  RegisterAddressState update({
    bool isStreetAddressValid,
    bool isCityValid,
    bool isStateValid,
  }) {
    return copyWith(
        isStreetAddressValid: isStreetAddressValid,
        isCityValid: isCityValid,
        isStateValid: isStateValid);
  }

  RegisterAddressState copyWith({
    bool isStreetAddressValid,
    bool isCityValid,
    bool isStateValid,
    bool isSubmitEnabled,
  }) {
    return RegisterAddressState(
      isStreetAddressValid: isStreetAddressValid ?? this.isStreetAddressValid,
      isCityValid: isCityValid ?? this.isCityValid,
      isStateValid: isStateValid ?? this.isStateValid,
    );
  }

  @override
  String toString() {
    return '''RegisterState {
      isStreetAddressValid: $isStreetAddressValid,
      isCityValid: $isCityValid,
      isStateValid: $isStateValid,
    }''';
  }
}
