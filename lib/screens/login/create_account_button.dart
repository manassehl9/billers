import 'package:flutter/material.dart';
import 'package:payment_app/resources/user_repository.dart';
import 'package:payment_app/screens/register/name/register_name_screen.dart';
import 'package:payment_app/utils/appTheme.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppTheme.getTheme().primaryColorDark),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return RegisterNameScreen(
                    userRepository: _userRepository,
                  );
                }),
              );
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: AppTheme.getTheme().colorScheme.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
