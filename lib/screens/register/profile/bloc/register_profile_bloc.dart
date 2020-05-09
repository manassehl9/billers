import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_app/screens/register/profile/bloc/bloc.dart';
import 'package:payment_app/resources/user_repository.dart';
import 'package:payment_app/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterProfileBloc
    extends Bloc<RegisterProfileEvent, RegisterProfileState> {
  final UserRepository _userRepository;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String gender;
  final String streetAddress;
  final String city;
  final String states;
  final String pin;

  RegisterProfileBloc(
      {@required UserRepository userRepository,
      @required this.firstName,
      @required this.lastName,
      @required this.dateOfBirth,
      @required this.gender,
      @required this.streetAddress,
      @required this.city,
      @required this.states,
      @required this.pin})
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
      return (event is! ProfileEmailChanged &&
          event is! ProfilePasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is ProfileEmailChanged || event is ProfilePasswordChanged);
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
    if (event is ProfileEmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is ProfilePasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is ProfileSubmitted) {
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
          firstName: firstName,
          lastName: lastName,
          dateOfBirth: dateOfBirth,
          gender: gender,
          streetAddress: streetAddress,
          city: city,
          states: states,
          pin: pin);
      yield RegisterProfileState.success();
    } catch (e) {
      yield RegisterProfileState.failure(e.toString());
    }
  }
}
