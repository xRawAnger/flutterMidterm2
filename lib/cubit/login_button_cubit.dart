import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_button_state.dart';

class LoginButtonCubit extends Cubit<LoginButtonState> {
  LoginButtonCubit() : super(LoginButtonInitial());
}
