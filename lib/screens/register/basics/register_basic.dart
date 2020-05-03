import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/authentication_bloc/authentication_bloc.dart';
import 'package:payment_app/screens/register/basics/bloc/bloc.dart';
import 'package:payment_app/screens/register/basics/register_basic_button.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RegisterBasic extends StatefulWidget {
  State<RegisterBasic> createState() => _RegisterBasicState();
}

class _RegisterBasicState extends State<RegisterBasic> {
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();

  RegisterBasicBloc _registerBasicBloc;
  String newDate;
  var formatter = new DateFormat('yyyy-MM-dd');

  bool get isPopulated =>
      _bankNameController.text.isNotEmpty &&
      _accountNameController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterBasicState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _bankNameController.addListener(_onBankNameChanged);
    _accountNameController.addListener(_onAccountNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBasicBloc, RegisterBasicState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registering...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registration Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder<RegisterBasicBloc, RegisterBasicState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Text('The Basics',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Give us a few details about yourself so we know you're real. ",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Date Of Birth',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1959, 3, 5),
                          maxTime: DateTime(2023, 6, 7),
                          theme: DatePickerTheme(
                              headerColor: Colors.orange,
                              backgroundColor: Colors.blue,
                              itemStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              doneStyle:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          onChanged: (DateTime date) {
                        newDate = formatter.format(date);
                        setState(() {
                          _bankNameController.text = newDate;
                        });
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        newDate = formatter.format(date);
                        setState(() {
                          _bankNameController.text = newDate;
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        autofocus: true,
                        controller: _bankNameController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true),
                        keyboardType: TextInputType.text,
                        enabled: true,
                        autovalidate: true,
                        autocorrect: false,
                        validator: (_) {
                          return !state.isAccountNameValid
                              ? 'Account Name cannot be empty'
                              : null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Account Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _accountNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true),
                    keyboardType: TextInputType.text,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {
                      return !state.isAccountNameValid
                          ? 'Account Name cannot be empty'
                          : null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RegisterBasicButton(
                    onPressed: isRegisterButtonEnabled(state)
                        ? _onFormSubmitted
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
    _bankNameController.dispose();
    _accountNameController.dispose();

    super.dispose();
  }

  void _onBankNameChanged() {
    _registerBasicBloc.add(
      BankNameChanged(bankName: _bankNameController.text),
    );
  }

  void _onAccountNameChanged() {
    _registerBasicBloc.add(
      AccountNameChanged(accountName: _accountNameController.text),
    );
  }

  void _onFormSubmitted() {
    _registerBasicBloc.add(
      Submitted(
        bankName: _bankNameController.text,
        accountName: _accountNameController.text,
      ),
    );
  }
}
