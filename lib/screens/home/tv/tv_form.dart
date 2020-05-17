import 'package:flutter/material.dart';
import 'package:payment_app/utils/appTheme.dart';
import 'package:payment_app/widgets/button.dart';

class TvForm extends StatefulWidget {
  @override
  _TvFormState createState() => _TvFormState();
}

class _TvFormState extends State<TvForm> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _serviceProviderController =
      TextEditingController();
  final TextEditingController _smartcardNumberController =
      TextEditingController();

  final TextEditingController _transactionPinController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Form(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Fill the form subscribe',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppTheme.getTheme().colorScheme.primary),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Amount',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppTheme.getTheme().colorScheme.primary),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
              keyboardType: TextInputType.number,
              autovalidate: true,
              autocorrect: false,
              validator: (_) {
                // return !state.isStreetAddressValid
                //     ? 'Street Address Cannot be empty'
                //     : null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Select Network',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppTheme.getTheme().colorScheme.primary),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _serviceProviderController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
              keyboardType: TextInputType.text,
              autovalidate: true,
              autocorrect: false,
              validator: (_) {
                //    return !state.isCityValid ? 'City Cannot be empty' : null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Smartcard Number',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppTheme.getTheme().colorScheme.primary),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _smartcardNumberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
              keyboardType: TextInputType.number,
              autovalidate: true,
              autocorrect: false,
              validator: (_) {
                //  return !state.isStateValid ? 'State Cannot be empty' : null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Transaction Pin',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppTheme.getTheme().colorScheme.primary),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _transactionPinController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
              keyboardType: TextInputType.number,
              autovalidate: true,
              autocorrect: false,
              validator: (_) {
                //  return !state.isStateValid ? 'State Cannot be empty' : null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              //  onPressed:
              //   isRegisterButtonEnabled(state) ? _onFormSubmitted : null,
              buttonName: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
