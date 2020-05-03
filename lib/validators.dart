class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
  static final RegExp _letterRegExp = RegExp('[a-zA-Z]');

  static final RegExp _numberRegExp = RegExp('[0-9]');

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isValidFirstName(String firstName) {
    return _letterRegExp.hasMatch(firstName);
  }

  static isValidLastName(String lastName) {
    return _letterRegExp.hasMatch(lastName);
  }

  static isValidDateOfBirth(String dateOfBirth) {
    if (dateOfBirth.length >= 1) {
      return true;
    }
    return false;
  }

  static isValidGender(String gender) {
    return _letterRegExp.hasMatch(gender);
  }

  static isValidBankName(String bankName) {
    return _letterRegExp.hasMatch(bankName);
  }

  static isValidAccountName(String accountName) {
    return _letterRegExp.hasMatch(accountName);
  }

  static isValidAccountNumber(String accountNumber) {
    return _numberRegExp.hasMatch(accountNumber);
  }

  static isValidPin(String pin) {
    if (_numberRegExp.hasMatch(pin) && pin.length >= 4) {
      return true;
    }
    return false;
  }
}
