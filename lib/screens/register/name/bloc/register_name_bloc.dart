import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:payment_app/screens/register/name/bloc/bloc.dart';
import 'package:payment_app/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterNameBloc extends Bloc<RegisterNameEvent, RegisterNameState> {
  @override
  RegisterNameState get initialState => RegisterNameState.empty();

  @override
  Stream<Transition<RegisterNameEvent, RegisterNameState>> transformEvents(
    Stream<RegisterNameEvent> events,
    TransitionFunction<RegisterNameEvent, RegisterNameState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! FirstNameChanged && event is! LastNameChanged);
    });
    final debounceStream = events.where((event) {
      return (event is FirstNameChanged || event is LastNameChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterNameState> mapEventToState(
    RegisterNameEvent event,
  ) async* {
    if (event is FirstNameChanged) {
      yield* _mapFirstNameChangedToState(event.firstName);
    } else if (event is LastNameChanged) {
      yield* _mapLastNameChangedToState(event.lastName);
    }
  }

  Stream<RegisterNameState> _mapFirstNameChangedToState(
      String firstName) async* {
    yield state.update(
      isFirstNameValid: Validators.isValidFirstName(firstName),
    );
  }

  Stream<RegisterNameState> _mapLastNameChangedToState(String lastName) async* {
    yield state.update(
      isLastNameValid: Validators.isValidLastName(lastName),
    );
  }

  Stream<RegisterNameState> _mapFormSubmittedToState(
    String firstName,
    String lastName,
  ) async* {
    yield RegisterNameState.loading();
    try {
      // await _userRepository.signUp(
      //   email: email,
      //   password: password,
      // );
      yield RegisterNameState.success();
    } catch (_) {
      yield RegisterNameState.failure();
    }
  }
}
