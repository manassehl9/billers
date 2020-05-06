import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/basics/register_basic_screen.dart';
import 'package:payment_app/screens/register/name/bloc/bloc.dart';
import 'package:payment_app/screens/register/name/register_name_button.dart';
import 'package:payment_app/user_repository.dart';

class RegisterName extends StatefulWidget {
  final UserRepository _userRepository;

  RegisterName({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  State<RegisterName> createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  RegisterNameBloc _registerNameBloc;

  bool get isPopulated =>
      _firstNameController.text.isNotEmpty &&
      _lastNameController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterNameState state) {
    return state.isFormValid && isPopulated;
  }

  @override
  void initState() {
    super.initState();
    _registerNameBloc = BlocProvider.of<RegisterNameBloc>(context);
    _firstNameController.addListener(_onFirstNameChanged);
    _lastNameController.addListener(_onLastNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterNameBloc, RegisterNameState>(
      listener: (context, state) {},
      child: BlocBuilder<RegisterNameBloc, RegisterNameState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Text('Your Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "This should be your full legal name as it appears on all your documents",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'First Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true),
                    keyboardType: TextInputType.text,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {
                      return !state.isFirstNameValid
                          ? 'First Name Cannot be empty'
                          : null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Last Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true),
                    keyboardType: TextInputType.text,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {
                      return !state.isLastNameValid
                          ? 'Last Name Cannot be empty'
                          : null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RegisterNameButton(
                    onPressed: isRegisterButtonEnabled(state)
                        ? () {
                            //pass in the details of firstname and last name
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterBasicScreen(
                                    userRepository: widget._userRepository,
                                    firstName: _firstNameController.text,
                                    lastName: _lastNameController.text),
                              ),
                            );
                          }
                        : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();

    super.dispose();
  }

  void _onFirstNameChanged() {
    _registerNameBloc.add(
      FirstNameChanged(firstName: _firstNameController.text),
    );
  }

  void _onLastNameChanged() {
    _registerNameBloc.add(
      LastNameChanged(lastName: _lastNameController.text),
    );
  }
}
