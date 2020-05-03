import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:payment_app/screens/register/basics/bloc/bloc.dart';
import 'package:payment_app/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBasicBloc extends Bloc<RegisterBasicEvent, RegisterBasicState> {
  
  @override
  RegisterBasicState get initialState => RegisterBasicState.empty();

  @override
  Stream<Transition<RegisterBasicEvent, RegisterBasicState>> transformEvents(
    Stream<RegisterBasicEvent> events,
    TransitionFunction<RegisterBasicEvent, RegisterBasicState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (
          event is! BankNameChanged &&
          event is! AccountNameChanged );
    });
    final debounceStream = events.where((event) {
      return (
          event is BankNameChanged ||
          event is AccountNameChanged );
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterBasicState> mapEventToState(
    RegisterBasicEvent event,
  ) async* {
   if (event is BankNameChanged) {
      yield* _mapBankNameChangedToState(event.bankName);
    } else if (event is AccountNameChanged) {
      yield* _mapAccountNameChangedToState(event.accountName);
    }  
  }


  Stream<RegisterBasicState> _mapBankNameChangedToState(String bankName) async* {
    yield state.update(
      isBankNameValid: Validators.isValidBankName(bankName),
    );
  }

  Stream<RegisterBasicState> _mapAccountNameChangedToState(String accountName) async* {
    yield state.update(
      isAccountNameValid: Validators.isValidAccountName(accountName),
    );
  }
}
