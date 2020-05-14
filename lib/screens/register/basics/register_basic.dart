import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/address/register_address_screen.dart';
import 'package:payment_app/screens/register/basics/bloc/bloc.dart';
import 'package:payment_app/resources/user_repository.dart';
import 'package:payment_app/utils/appTheme.dart';
import 'package:payment_app/widgets/button.dart';

class RegisterBasic extends StatefulWidget {
  final UserRepository _userRepository;
  final String firstName;
  final String lastName;

  RegisterBasic(
      {Key key,
      @required UserRepository userRepository,
      @required this.firstName,
      @required this.lastName})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  State<RegisterBasic> createState() => _RegisterBasicState();
}

class _RegisterBasicState extends State<RegisterBasic> {
  final TextEditingController _dateofBirthController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  static List<GenderModel> _dropdownItems = new List();
  GenderModel _dropdownValue;

  RegisterBasicBloc _registerBasicBloc;
  String newDate;
  var formatter = new DateFormat('yyyy-MM-dd');

  bool get isPopulated =>
      _dateofBirthController.text.isNotEmpty &&
      _genderController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterBasicState state) {
    return state.isFormValid && isPopulated;
  }

  @override
  void initState() {
    super.initState();
    _dropdownItems = [];
    setState(() {
      _dropdownItems.add(GenderModel(gender: 'Male'));
      _dropdownItems.add(GenderModel(gender: 'Female'));
      _dropdownValue = _dropdownItems[0];
      _genderController.text = _dropdownValue.gender;
    });
    _registerBasicBloc = BlocProvider.of<RegisterBasicBloc>(context);
    _dateofBirthController.addListener(_onDateOfBirthChanged);
    _genderController.addListener(_onGenderChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBasicBloc, RegisterBasicState>(
      listener: (context, state) {},
      child: BlocBuilder<RegisterBasicBloc, RegisterBasicState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Image.asset(
                    'assets/calendar.png',
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The Basics',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppTheme.getTheme().colorScheme.primary),
                  ),
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppTheme.getTheme().colorScheme.primary),
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
                              headerColor:
                                  AppTheme.getTheme().colorScheme.primary,
                              backgroundColor: AppTheme.getTheme()
                                  .colorScheme
                                  .primaryVariant,
                              itemStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              doneStyle:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          onChanged: (DateTime date) {
                        newDate = formatter.format(date);
                        setState(() {
                          _dateofBirthController.text = newDate;
                        });
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        newDate = formatter.format(date);
                        setState(() {
                          _dateofBirthController.text = newDate;
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        autofocus: true,
                        controller: _dateofBirthController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true),
                        keyboardType: TextInputType.text,
                        enabled: true,
                        autovalidate: true,
                        autocorrect: false,
                        validator: (_) {
                          return !state.isDateOfBirthValid
                              ? 'Pick a date'
                              : null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppTheme.getTheme().colorScheme.primary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputDecorator(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true,
                      hintText: 'Choose Gender',
                    ),
                    isEmpty: _dropdownValue == null,
                    child: DropdownButton<GenderModel>(
                      value: _dropdownValue,
                      isDense: true,
                      onChanged: (GenderModel newValue) {
                        setState(() {
                          _dropdownValue = newValue;
                          _genderController.text = _dropdownValue.gender;
                        });
                      },
                      items: _dropdownItems.map((GenderModel value) {
                        return DropdownMenuItem<GenderModel>(
                          value: value,
                          child: Text(value.gender),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                    onPressed: isRegisterButtonEnabled(state)
                        ? _onFormSubmitted
                        : null,
                    buttonName: 'Next',
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
    _dateofBirthController.dispose();
    _genderController.dispose();

    super.dispose();
  }

  void _onDateOfBirthChanged() {
    _registerBasicBloc.add(
      DateOfBirthChanged(dateOfBirth: _dateofBirthController.text),
    );
  }

  void _onGenderChanged() {
    _registerBasicBloc.add(
      GenderChanged(gender: _genderController.text),
    );
  }

  void _onFormSubmitted() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterAddressScreen(
            userRepository: widget._userRepository,
            firstName: widget.firstName,
            lastName: widget.lastName,
            dateOfBirth: _dateofBirthController.text.trim(),
            gender: _genderController.text.trim().toLowerCase()),
      ),
    );
  }
}

class GenderModel {
  String gender;

  GenderModel({this.gender});
}
