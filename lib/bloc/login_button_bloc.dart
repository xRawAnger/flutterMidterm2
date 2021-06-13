import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_button_event.dart';
part 'login_button_state.dart';

class LoginButtonBloc extends Bloc<MyLoginEvent, LoginButtonState> {
  LoginButtonBloc() : super(LoginButtonInitial());

  @override
  Stream<LoginButtonState> mapEventToState(
      MyLoginEvent event,
  ) async* {
    switch (event) {
      case MyLoginEvent.loginButtonInitial:
        yield LoginButtonInitial();
        break;
      case MyLoginEvent.loginButtonToHome:
        yield LoginButtonToHome();
        break;
    }
  }
}
