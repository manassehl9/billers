import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_app/screens/register/profile/bloc/bloc.dart';
import 'package:payment_app/user_repository.dart';
import 'package:payment_app/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterProfileBloc
    extends Bloc<RegisterProfileEvent, RegisterProfileState> {
  final UserRepository _userRepository;

  RegisterProfileBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterProfileState get initialState => RegisterProfileState.empty();

  @override
  Stream<Transition<RegisterProfileEvent, RegisterProfileState>>
      transformEvents(
    Stream<RegisterProfileEvent> events,
    TransitionFunction<RegisterProfileEvent, RegisterProfileState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterProfileState> mapEventToState(
    RegisterProfileEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password);
    }
  }

  Stream<RegisterProfileState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterProfileState> _mapPasswordChangedToState(
      String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegisterProfileState> _mapFormSubmittedToState(
    String email,
    String password,
  ) async* {
    yield RegisterProfileState.loading();
    try {
      await _userRepository.signUp(
        email: email,
        password: password,
      );
      yield RegisterProfileState.success();
    } catch (_) {
      yield RegisterProfileState.failure();
    }
  }
}
